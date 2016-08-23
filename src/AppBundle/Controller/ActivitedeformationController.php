<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Activitedeformation;
use AppBundle\Entity\Programmedeformation;
use AppBundle\Entity\Moduledeformation;
use AppBundle\Entity\Sequencedeformation;
use AppBundle\Form\ActivitedeformationType;

/**
 * Activitedeformation controller.
 *
 * @Route("/activite")
 */
class ActivitedeformationController extends Controller
{
    /**
     * Lists all Activitedeformation entities.
     *
     * @Route("/", name="activite_super_index")
     * @Method("GET")
     */
    public function indexSuperAction()
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem("Modules index", $this->get("router")->generate("module_super_index"));
        $breadcrumbs->addItem("Sequence index", $this->get("router")->generate("sequence_super_index"));
        $breadcrumbs->addItem("Activity index");

        $em = $this->getDoctrine()->getManager();

        $activitedeformations = $em->getRepository('AppBundle:Activitedeformation')->findAll();

        return $this->render('activitedeformation/index.html.twig', array(
            'activitedeformations' => $activitedeformations,
        ));
    }

    /**
     * Lists all Activitedeformation entities.
     *
     * @Route("/{progid}/{modid}/{seqid}", name="activite_index")
     * @Method("GET")
     */
    public function indexAction(Programmedeformation $progid, Moduledeformation $modid , Sequencedeformation $seqid)
    {
        // Manage Breadcrumbs
        $this->generateBreadcrumb($progid, $modid, $seqid, "Index");

        $em = $this->getDoctrine()->getManager();

        $activitedeformations = $em->getRepository('AppBundle:Activitedeformation')->findAll();

        return $this->render('activitedeformation/index.html.twig', array(
            'activitedeformations' => $activitedeformations,
            'program' => $progid,
            'module'=> $modid,
            'sequence' => $seqid,
        ));
    }

    /**
     * Creates a new Activitedeformation entity.
     *
     * @Route("/{progid}/{modid}/{seqid}/new", name="activite_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request, Programmedeformation $progid, Moduledeformation $modid, Sequencedeformation $seqid)
    {
        $logger = $this->get('logger');
        $activitedeformation = new Activitedeformation();

         // Manage Breadcrumbs
        $this->generateBreadcrumb($progid, $modid, $seqid, "Nouvelle Activité");

        // Predefine values
        $activitedeformation->setSequenceid($seqid);        
        $query = $this->getDoctrine()->getManager()->createQuery(
            'SELECT a
            FROM AppBundle:Activitedeformation a
            WHERE a.code like :code
            ORDER BY a.code DESC'
        )->setParameter('code', $seqid->getCode().'-%');

        $activities = $query->getResult();
        if(count($activities)>0){
            $aTmpCode = explode('-', $activities[0]->getCode());
            $newCodeNbr = intval($aTmpCode[count($aTmpCode)-1])+1;
            $newCode = $seqid->getCode().'-';
            ($newCodeNbr<10)?$newCode.="0".$newCodeNbr:$newCode.=$newCodeNbr;
            $activitedeformation->setCode($newCode);
        }
        else{
            $activitedeformation->setCode($seqid->getCode().'-');
        }

        $opt = array('attr' =>array('moduleid' => $modid->getId()));


        $form = $this->createForm('AppBundle\Form\ActivitedeformationType', $activitedeformation, $opt);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($activitedeformation);
            $em->flush();

            return $this->redirectToRoute('activite_show', array(
                'actid' => $activitedeformation->getId(),
                'progid' => $progid->getId(),
                'modid'=> $modid->getId(),
                'seqid' =>$seqid->getId(),
                ));
        }

        return $this->render('activitedeformation/new.html.twig', array(
            'activitedeformation' => $activitedeformation,
            'sequence' => $seqid,
            'module' => $modid,
            'program' => $progid,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Activitedeformation entity.
     *
     * @Route("/{progid}/{modid}/{seqid}/{actid}", name="activite_show")
     * @Method("GET")
     */
    public function showAction(Programmedeformation $progid, Moduledeformation $modid, Sequencedeformation $seqid, Activitedeformation $actid)
    {

        // Manage Breadcrumbs
        $this->generateBreadcrumb($progid, $modid, $seqid, $actid);



        $deleteForm = $this->createDeleteForm($progid, $modid, $seqid, $actid);

        $em = $this->getDoctrine()->getManager();
        $links = $em->getRepository('AppBundle:Linkactiviteoutil')->findBy(array(
            "activiteid" => $actid->getId()
        ));

        $tools = array();
        foreach ($links as $key => $link) {
           array_push($tools , $em->getRepository('AppBundle:Outildeformation')->find($link->getOutilid()));
        }
        return $this->render('activitedeformation/show.html.twig', array(
            'activitedeformation' => $actid,
            'program' => $progid,
            'module'=> $modid,
            'sequence' => $seqid,
            'outils' => $tools,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Activitedeformation entity.
     *
     * @Route("/{progid}/{modid}/{seqid}/{actid}/edit", name="activite_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request,Programmedeformation $progid, Moduledeformation $modid, Sequencedeformation $seqid, Activitedeformation $actid)
    {

        // Manage Breadcrumbs
        $this->generateBreadcrumb($progid, $modid, $seqid, $actid);

        $deleteForm = $this->createDeleteForm($progid, $modid, $seqid, $actid);

        $opt = array('attr' =>array('moduleid' => $modid->getId()));

        $editForm = $this->createForm('AppBundle\Form\ActivitedeformationType', $actid, $opt);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($actid);
            $em->flush();

            return $this->redirectToRoute('activite_edit', array(
                    'actid' => $actid->getId(),
                    'seqid' => $seqid->getId(),
                    'modid' => $modid->getId(),
                    'progid' => $progid->getId()
                ));
        }

        return $this->render('activitedeformation/edit.html.twig', array(
            'program' => $progid,
            'module'=>$modid,
            'sequence'=>$seqid,
            'activitedeformation' => $actid,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Activitedeformation entity.
     *
     * @Route("/{progid}/{modid}/{seqid}/{actid}", name="activite_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request,Programmedeformation $progid, Moduledeformation $modid, Sequencedeformation $seqid, Activitedeformation $actid)
    {

        // Manage Breadcrumbs
        $this->generateBreadcrumb($progid, $modid, $seqid, $actid);
        $form = $this->createDeleteForm($progid, $modid, $seqid, $actid);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();

            // Remove links to tools
            $links = $em->getRepository('AppBundle:Linkactiviteoutil')->findBy(array(
                "activiteid" => $actid->getId()
            ));
            if(count($links)>0){
                foreach ($links as $key => $link) {
                   $em->remove($link);
                }
            }

            // Remove activity
            $em->remove($actid);
            $em->flush();
        }

        return $this->redirectToRoute('activite_index', array(
                    'seqid' => $seqid->getId(),
                    'modid' => $modid->getId(),
                    'progid' => $progid->getId()
                ));
    }

    /**
     * Creates a form to delete a Activitedeformation entity.
     *
     * @param Activitedeformation $activitedeformation The Activitedeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Programmedeformation $prog, Moduledeformation $module, Sequencedeformation $seq,Activitedeformation $activitedeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('activite_delete', array(
                'actid' => $activitedeformation->getId(),
                'seqid' => $seq->getId(),
                'modid' => $module->getId(),
                'progid' => $prog->getId()
            )))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }

    /*
    * Generate Breadcrumb
    */
    private function generateBreadcrumb(Programmedeformation $prog, Moduledeformation $module, Sequencedeformation $seq, $activitedeformation){
        

        $breadcrumbs = $this->get("white_october_breadcrumbs");
        if(!is_null($prog)){
            $breadcrumbs->addItem($prog->getIntitule(), $this->get("router")->generate("programme_show", array('progid'=>$prog->getId())));
            if(!is_null($module)){
                $breadcrumbs->addItem($module->getCode(), $this->get("router")->generate("module_show", array('progid'=>$prog->getId(), 'modid'=>$module->getId())));
                if(!is_null($seq)){
                    $breadcrumbs->addItem($seq->getCode(), $this->get("router")->generate("sequence_show", array('progid'=>$prog->getId(), 'modid'=>$module->getId(), 'seqid'=>$seq->getId())));
                    if($activitedeformation instanceof Activitedeformation){
                        $breadcrumbs->addItem($activitedeformation->getCode());
                    }
                    else if(!is_null($activitedeformation)){
                        $breadcrumbs->addItem($activitedeformation);
                    }
                }
            }
        }else{
            $logger = $this->get('logger');
            $logger->error('Undefined breadcrumb');
        }

    }
}
