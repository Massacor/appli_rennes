<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Moduledeformation;
use AppBundle\Entity\Linkprogrammemodule;
use AppBundle\Entity\Programmedeformation;
use AppBundle\Form\ModuledeformationType;

/**
 * Moduledeformation controller.
 *
 * @Route("/module")
 */
class ModuledeformationController extends Controller
{
    /**
     * Lists all Module de formation entities. With no filter on program.
     * Viex to be used only by moderator.
     *
     * @Route("/", name="module_super_index")
     * @Method("GET")
     */
    public function indexSuperAction()
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem("Modules index");

        $em = $this->getDoctrine()->getManager();
        $moduledeformations = $em->getRepository('AppBundle:Moduledeformation')->findAll();

        return $this->render('moduledeformation/index.html.twig', array(
            'module' => $moduledeformations,

        ));
    }
     /**
     * Lists all Moduledeformation entities.
     *
     * @Route("/{progid}", name="module_index")
     * @Method("GET")
     */
    public function indexAction(Programmedeformation $progid)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem("Modules index");

        $em = $this->getDoctrine()->getManager();
        $moduledeformations = $em->getRepository('AppBundle:Moduledeformation')->findAll();

        return $this->render('moduledeformation/index.html.twig', array(
            'moduledeformations' => $moduledeformations,
            'program' => $progid,
        ));
    }

    /**
     * Creates a new Moduledeformation entity.
     *
     * @Route("/{progid}/new", name="module_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request, Programmedeformation $progid)
    {
         // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem( $progid->getIntitule(), $this->get("router")->generate("programme_show", array('progid' => $progid->getId())));
        $breadcrumbs->addItem("New module");

        $moduledeformation = new Moduledeformation();
        $form = $this->createForm('AppBundle\Form\ModuledeformationType', $moduledeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($moduledeformation);

            $linkProg2Module = new Linkprogrammemodule();
            $linkProg2Module->setProgrammeid($progid);
            $linkProg2Module->setModuleid($moduledeformation);
            $em->persist($linkProg2Module);


            $em->flush();

            return $this->redirectToRoute('module_show', array(
                'modid' => $moduledeformation->getId(),
                'progid' => $progid->getId(),
            ));
        }

        return $this->render('moduledeformation/new.html.twig', array(
            'module' => $moduledeformation,
            'program' => $progid,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Moduledeformation entity.
     *
     * @Route("/{progid}/{modid}", name="module_show")
     * @Method("GET")
     */
    public function showAction(Programmedeformation $progid, Moduledeformation $modid)
    {
       
         // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
      
        $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array('progid' => $progid->getId())));
        $breadcrumbs->addItem($modid->getCode());

        $deleteForm = $this->createDeleteForm($progid, $modid);

        $em = $this->getDoctrine()->getManager();

        $sequences= $em->getRepository('AppBundle:Sequencedeformation')->findBy(array('moduleid' => $modid->getId()));

        return $this->render('moduledeformation/show.html.twig', array(
            'module' => $modid,
            'program' => $progid,
            'sequences' => $sequences,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Moduledeformation entity.
     *
     * @Route("/{progid}/{modid}/edit", name="module_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Programmedeformation $progid, Moduledeformation $modid)
    {
         // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array('progid' => $progid->getId())));
        $breadcrumbs->addItem($modid->getCode());

        $deleteForm = $this->createDeleteForm($progid, $modid);
        $editForm = $this->createForm('AppBundle\Form\ModuledeformationType', $modid);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($modid);
            $em->flush();

            return $this->redirectToRoute('module_edit', array(
                'modid' => $modid->getId(),
                'progid' => $progid->getId()));
        }

        return $this->render('moduledeformation/edit.html.twig', array(
            'program' =>$progid,
            'module' => $modid,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Moduledeformation entity.
     *
     * @Route("/{progid}/{modid}", name="module_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Programmedeformation $progid, Moduledeformation $modid)
    {
         // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem($progid->getIntitule(), $this->get("router")->generate("programme_show", array('progid' => $progid->getId())));
        $breadcrumbs->addItem($modid->getCode());
        
        $form = $this->createDeleteForm($progid, $modid);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();

            // Manage link programme <-> module deletion

            $linkProg2Module = $em->getRepository('AppBundle:Linkprogrammemodule')->findBy(array('moduleid' => $modid->getId()));
            foreach ($linkProg2Module as $key => $link) {
                           $em->remove($link);
            }
            $em->remove($modid);
            $em->flush();
        }

        return $this->redirectToRoute('module_index', array('progid'=>$progid->getId()));
    }

    /**
     * Creates a form to delete a Moduledeformation entity.
     *
     * @param Moduledeformation $moduledeformation The Moduledeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Programmedeformation $prog, Moduledeformation $moduledeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('module_delete', array('modid' => $moduledeformation->getId(), 'progid' => $prog->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
