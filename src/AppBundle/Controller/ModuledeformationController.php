<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Moduledeformation;
use AppBundle\Entity\Linkprogrammemodule;
use AppBundle\Form\ModuledeformationType;

/**
 * Moduledeformation controller.
 *
 * @Route("/module")
 */
class ModuledeformationController extends Controller
{
    /**
     * Lists all Moduledeformation entities.
     *
     * @Route("/", name="module_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $moduledeformations = $em->getRepository('AppBundle:Moduledeformation')->findAll();

        return $this->render('moduledeformation/index.html.twig', array(
            'moduledeformations' => $moduledeformations,
        ));
    }

    /**
     * Creates a new Moduledeformation entity.
     *
     * @Route("/new", name="module_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {

        $moduledeformation = new Moduledeformation();
        $form = $this->createForm('AppBundle\Form\ModuledeformationType', $moduledeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($moduledeformation);

            // Manage link programme <-> module creation
            if(isset($_GET['programmeId'])){
                $programme =  $em->getRepository('AppBundle:Programmedeformation')->find($_GET['programmeId']);
                $linkProg2Module = new Linkprogrammemodule();
                $linkProg2Module->setProgrammeid($programme);
                $linkProg2Module->setModuleid($moduledeformation);
                $em->persist($linkProg2Module);
            }

            $em->flush();

            return $this->redirectToRoute('module_show', array('id' => $moduledeformation->getId()));
        }

        return $this->render('moduledeformation/new.html.twig', array(
            'moduledeformation' => $moduledeformation,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Moduledeformation entity.
     *
     * @Route("/{id}", name="module_show")
     * @Method("GET")
     */
    public function showAction(Moduledeformation $moduledeformation)
    {
        $deleteForm = $this->createDeleteForm($moduledeformation);

        $em = $this->getDoctrine()->getManager();

        $sequences= $em->getRepository('AppBundle:Sequencedeformation')->findBy(array('moduleid' => $moduledeformation->getId()));

        return $this->render('moduledeformation/show.html.twig', array(
            'moduledeformation' => $moduledeformation,
            'sequences' => $sequences,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Moduledeformation entity.
     *
     * @Route("/{id}/edit", name="module_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Moduledeformation $moduledeformation)
    {
        $deleteForm = $this->createDeleteForm($moduledeformation);
        $editForm = $this->createForm('AppBundle\Form\ModuledeformationType', $moduledeformation);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($moduledeformation);
            $em->flush();

            return $this->redirectToRoute('module_edit', array('id' => $moduledeformation->getId()));
        }

        return $this->render('moduledeformation/edit.html.twig', array(
            'moduledeformation' => $moduledeformation,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Moduledeformation entity.
     *
     * @Route("/{id}", name="module_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Moduledeformation $moduledeformation)
    {
        $form = $this->createDeleteForm($moduledeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();

            // Manage link programme <-> module deletion

            $linkProg2Module = $em->getRepository('AppBundle:Linkprogrammemodule')->findBy(array('moduleid' => $moduledeformation->getId()));
            foreach ($linkProg2Module as $key => $link) {
                           $em->remove($link);
            }
            $em->remove($moduledeformation);
            $em->flush();
        }

        return $this->redirectToRoute('module_index');
    }

    /**
     * Creates a form to delete a Moduledeformation entity.
     *
     * @param Moduledeformation $moduledeformation The Moduledeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Moduledeformation $moduledeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('module_delete', array('id' => $moduledeformation->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
