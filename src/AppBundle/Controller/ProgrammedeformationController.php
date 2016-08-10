<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Programmedeformation;
use AppBundle\Form\ProgrammedeformationType;

/**
 * Programmedeformation controller.
 *
 * @Route("/programme")
 */
class ProgrammedeformationController extends Controller
{
    /**
     * Lists all Programmedeformation entities.
     *
     * @Route("/", name="programme_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem("Programme index");

        $em = $this->getDoctrine()->getManager();
        $programmedeformations = $em->getRepository('AppBundle:Programmedeformation')->findAll();

        return $this->render('programmedeformation/index.html.twig', array(
            'programmedeformations' => $programmedeformations,
        ));
    }

    /**
     * Creates a new Programmedeformation entity.
     *
     * @Route("/new", name="programme_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem("New program");

        $programmedeformation = new Programmedeformation();
        $form = $this->createForm('AppBundle\Form\ProgrammedeformationType', $programmedeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($programmedeformation);
            $em->flush();

            return $this->redirectToRoute('programme_show', array('id' => $programmedeformation->getId()));
        }

        return $this->render('programmedeformation/new.html.twig', array(
            'programmedeformation' => $programmedeformation,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Programmedeformation entity.
     *
     * @Route("/{progid}", name="programme_show")
     * @Method("GET")
     */
    public function showAction(Programmedeformation $progid)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem($progid->getIntitule());
        //$breadcrumbs->addItem("Some text without link");
        $deleteForm = $this->createDeleteForm($progid);

        $em = $this->getDoctrine()->getManager();

        $linkProgrammeModule = $em->getRepository('AppBundle:Linkprogrammemodule')->findBy(array('programmeid' => $progid->getId()));

        $modules = array();
        foreach ($linkProgrammeModule as $key => $link) {
            $module = $em->getRepository('AppBundle:Moduledeformation')->find($link->getModuleid());
            array_push($modules , $module);
        }

        return $this->render('programmedeformation/show.html.twig', array(
            'programmedeformation' => $progid,
            'modules' => $modules,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Programmedeformation entity.
     *
     * @Route("/{progid}/edit", name="programme_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Programmedeformation $progid)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem($progid->getIntitule());

        $deleteForm = $this->createDeleteForm($progid);
        $editForm = $this->createForm('AppBundle\Form\ProgrammedeformationType', $progid);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($progid);
            $em->flush();

            return $this->redirectToRoute('programme_edit', array('progid' => $progid->getId()));
        }

        return $this->render('programmedeformation/edit.html.twig', array(
            'programmedeformation' => $progid,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Programmedeformation entity.
     *
     * @Route("/{progid}", name="programme_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Programmedeformation $progid)
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem($progid->getIntitule());

        $form = $this->createDeleteForm($progid);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($progid);
            $em->flush();
        }

        return $this->redirectToRoute('programme_index');
    }

    /**
     * Creates a form to delete a Programmedeformation entity.
     *
     * @param Programmedeformation $programmedeformation The Programmedeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Programmedeformation $programmedeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('programme_delete', array('progid' => $programmedeformation->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
