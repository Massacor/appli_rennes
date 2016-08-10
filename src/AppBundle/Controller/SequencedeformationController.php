<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Sequencedeformation;
use AppBundle\Entity\Moduledeformation;
use AppBundle\Entity\Programmedeformation;
use AppBundle\Form\SequencedeformationType;

/**
 * Sequencedeformation controller.
 *
 * @Route("/sequence")
 */
class SequencedeformationController extends Controller
{
     /**
     * Lists all Sequence de formation entities. No filter on program nor module.
     * View should only be viewed bu super user.
     *
     * @Route("/", name="sequence_super_index")
     * @Method("GET")
     */
    public function indexSuperAction()
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem("Modules index", $this->get("router")->generate("module_super_index"));
         $breadcrumbs->addItem("Sequence index");

        $em = $this->getDoctrine()->getManager();

        $sequencedeformations = $em->getRepository('AppBundle:Sequencedeformation')->findAll();

        return $this->render('sequencedeformation/index.html.twig', array(
            'sequencedeformations' => $sequencedeformations,
        ));
    }

    /**
     * Lists all Sequencedeformation entities.
     *
     * @Route("/{progid}/{modid}", name="sequence_index")
     * @Method("GET")
     */
    public function indexAction(Programmedeformation $progid, Moduledeformation $modid)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array('progid' => $progid->getId())));
        $breadcrumbs->addItem("Modules index", $this->get("router")->generate("module_show", array('modid'=>$modid->getId(), 'progid' => $progid->getId())));
         $breadcrumbs->addItem("Sequence index");

        $em = $this->getDoctrine()->getManager();

        $sequencedeformations = $em->getRepository('AppBundle:Sequencedeformation')->findBy(array(
            'moduleid' => $modid->getId()
            ));

        return $this->render('sequencedeformation/index.html.twig', array(
            'sequencedeformations' => $sequencedeformations,
            'module' => $modid,
            'program' => $progid,
        ));
    }

    /**
     * Creates a new Sequencedeformation entity.
     *
     * @Route("/{progid}/{modid}/new", name="sequence_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request, Programmedeformation $progid, Moduledeformation $modid)
    {
        $logger = $this->get('logger');
        $sequencedeformation = new Sequencedeformation();

         // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array(
            'progid'=>$progid->getId())));

        //Predefine values
        $sequencedeformation->setModuleid($modid);
        $sequencedeformation->setCode($modid->getCode().'-');

        //Manage breadcrumb
        $breadcrumbs->addItem($modid->getCode(), $this->get("router")->generate("module_show", array(
            "modid"=> $modid->getId(),
            'progid' => $progid->getId(),
            )));

        // else{
        //     $breadcrumbs->addItem("Module index", $this->get("router")->generate("module_super_index"));
        //     $logger->error('Module ID should always be predefined.');
        // }


        $breadcrumbs->addItem("New sequence");

        $form = $this->createForm('AppBundle\Form\SequencedeformationType', $sequencedeformation);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($sequencedeformation);
            $em->flush();

            return $this->redirectToRoute('sequence_show', array(
                'seqid' => $sequencedeformation->getId(),
                'modid' => $modid->getId(),
                'progid' => $progid->getId()
                ));
        }

        return $this->render('sequencedeformation/new.html.twig', array(
            'sequencedeformation' => $sequencedeformation,
            'program' => $progid,
            'module' => $modid,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Sequencedeformation entity.
     *
     * @Route("/{progid}/{modid}/{seqid}", name="sequence_show")
     * @Method("GET")
     */
    public function showAction(Programmedeformation $progid, Moduledeformation  $modid,Sequencedeformation $seqid)
    {
        
        $log = $this->get('logger');
        $log->info('pouet');
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
         $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array(
            'progid'=>$progid->getId())));
        $breadcrumbs->addItem($modid->getCode(), $this->get("router")->generate("module_show", array('modid'=>$modid->getId(), 'progid'=>$progid->getId())));
        $breadcrumbs->addItem($seqid->getCode(), $this->get("router")->generate("sequence_show", array('seqid'=>$seqid->getId(), 'modid'=>$modid->getId(), 'progid'=>$progid->getId())));

        $deleteForm = $this->createDeleteForm($progid, $modid, $seqid);

        $em = $this->getDoctrine()->getManager();
        $activites= $em->getRepository('AppBundle:Activitedeformation')->findBy(array('sequenceid' => $seqid->getId()));

        return $this->render('sequencedeformation/show.html.twig', array(
            'program' => $progid,
            'module' => $modid,
            'sequencedeformation' => $seqid,
            'activites' => $activites,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Sequencedeformation entity.
     *
     * @Route("/{progid}/{modid}/{seqid}/edit", name="sequence_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Programmedeformation $progid, Moduledeformation $modid,Sequencedeformation $seqid)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array(
            'progid'=>$progid->getId())));
        $breadcrumbs->addItem($seqid->getModuleid(), $this->get("router")->generate("module_show", array('modid'=>$modid->getId(), 'progid'=>$progid->getId())));
        $breadcrumbs->addItem($seqid->getCode(), $this->get("router")->generate("sequence_show", array('seqid'=>$seqid->getId(), 'modid'=>$modid->getId(), 'progid'=>$progid->getId())));

        $deleteForm = $this->createDeleteForm($progid, $modid, $seqid);
        $editForm = $this->createForm('AppBundle\Form\SequencedeformationType', $seqid);

        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($seqid);
            $em->flush();

            return $this->redirectToRoute('sequence_edit', array(
                'seqid' => $seqid->getId(), 
                'modid'=>$modid->getId(),
                'progid' => $progid->getId()));
        }

        return $this->render('sequencedeformation/edit.html.twig', array(
            'sequencedeformation' => $seqid,
            'module' => $modid,
            'program'=> $progid,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Sequencedeformation entity.
     *
     * @Route("/{progid}/{modid}/{seqid}", name="sequence_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request,Programmedeformation $progid, Moduledeformation $modid, Sequencedeformation $seqid)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array(
            'progid'=>$progid->getId())));
        $breadcrumbs->addItem($seqid->getModuleid(), $this->get("router")->generate("module_show", array('modid'=>$modid->getId(), 'progid'=>$progid->getId())));
        $breadcrumbs->addItem($seqid->getCode(), $this->get("router")->generate("sequence_show", array('seqid'=>$seqid->getId(), 'modid'=>$modid->getId(), 'progid'=>$progid->getId())));

        $form = $this->createDeleteForm($progid, $modid, $seqid);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($seqid);
            $em->flush();
        }

        return $this->redirectToRoute('sequence_index', array(
            'modid'=>$modid->getId(), 
            'progid'=>$progid->getId()
        ));
    }

    /**
     * Creates a form to delete a Sequencedeformation entity.
     *
     * @param Sequencedeformation $sequencedeformation The Sequencedeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Programmedeformation $prog, Moduledeformation $module, Sequencedeformation $sequencedeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('sequence_delete', array('seqid' => $sequencedeformation->getId(), 'progid' =>$prog->getId(), 'modid'=>$module->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }

    /*
    * Function generating an array ['id' => 'code']
    * Used in forms 
    */
    public function getChoiceList() {
        $res = array();
        $em = $this->getDoctrine()->getManager();
        $sequencedeformations = $em->getRepository('AppBundle:Sequencedeformation')->findAll();
        foreach ($sequencedeformations as $key => $sequence) {
            $res[$sequence->getId()] = $sequence->getCode();
        }
        return new ArrayChoiceList($res);
   }
}
