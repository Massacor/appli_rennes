<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Sequencedeformation;
use AppBundle\Form\SequencedeformationType;

/**
 * Sequencedeformation controller.
 *
 * @Route("/sequence")
 */
class SequencedeformationController extends Controller
{
    /**
     * Lists all Sequencedeformation entities.
     *
     * @Route("/", name="sequence_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $sequencedeformations = $em->getRepository('AppBundle:Sequencedeformation')->findAll();

        return $this->render('sequencedeformation/index.html.twig', array(
            'sequencedeformations' => $sequencedeformations,
        ));
    }

    /**
     * Creates a new Sequencedeformation entity.
     *
     * @Route("/new", name="sequence_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $sequencedeformation = new Sequencedeformation();
        if(isset($_GET['moduleid']))
            $sequencedeformation->setModuleid($_GET['moduleid']);

        $form = $this->createForm('AppBundle\Form\SequencedeformationType', $sequencedeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($sequencedeformation);
            $em->flush();

            return $this->redirectToRoute('sequence_show', array('id' => $sequencedeformation->getId()));
        }

        return $this->render('sequencedeformation/new.html.twig', array(
            'sequencedeformation' => $sequencedeformation,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Sequencedeformation entity.
     *
     * @Route("/{id}", name="sequence_show")
     * @Method("GET")
     */
    public function showAction(Sequencedeformation $sequencedeformation)
    {
        $deleteForm = $this->createDeleteForm($sequencedeformation);

        $em = $this->getDoctrine()->getManager();
        $activites= $em->getRepository('AppBundle:Activitedeformation')->findBy(array('sequenceid' => $sequencedeformation->getId()));

        return $this->render('sequencedeformation/show.html.twig', array(
            'sequencedeformation' => $sequencedeformation,
            'activites' => $activites,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Sequencedeformation entity.
     *
     * @Route("/{id}/edit", name="sequence_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Sequencedeformation $sequencedeformation)
    {
        $deleteForm = $this->createDeleteForm($sequencedeformation);
        $editForm = $this->createForm('AppBundle\Form\SequencedeformationType', $sequencedeformation);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($sequencedeformation);
            $em->flush();

            return $this->redirectToRoute('sequence_edit', array('id' => $sequencedeformation->getId()));
        }

        return $this->render('sequencedeformation/edit.html.twig', array(
            'sequencedeformation' => $sequencedeformation,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Sequencedeformation entity.
     *
     * @Route("/{id}", name="sequence_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Sequencedeformation $sequencedeformation)
    {
        $form = $this->createDeleteForm($sequencedeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($sequencedeformation);
            $em->flush();
        }

        return $this->redirectToRoute('sequence_index');
    }

    /**
     * Creates a form to delete a Sequencedeformation entity.
     *
     * @param Sequencedeformation $sequencedeformation The Sequencedeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Sequencedeformation $sequencedeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('sequence_delete', array('id' => $sequencedeformation->getId())))
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
