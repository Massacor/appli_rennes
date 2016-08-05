<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use AppBundle\Entity\Activitedeformation;
use AppBundle\Form\ActivitedeformationType;

/**
 * Activitedeformation controller.
 *
 */
class ActivitedeformationController extends Controller
{
    /**
     * Lists all Activitedeformation entities.
     *
     */
    /*public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $activitedeformations = $em->getRepository('AppBundle:Activitedeformation')->findAll();

        return $this->render('activitedeformation/index.html.twig', array(
            'activitedeformations' => $activitedeformations,
        ));
    }*/

    /**
     * Creates a new Activitedeformation entity.
     *
     */
    /*public function newAction(Request $request)
    {
        $activitedeformation = new Activitedeformation();
        $form = $this->createForm('AppBundle\Form\ActivitedeformationType', $activitedeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($activitedeformation);
            $em->flush();

            return $this->redirectToRoute('activitedeformation_show', array('id' => $activitedeformation->getId()));
        }

        return $this->render('activitedeformation/new.html.twig', array(
            'activitedeformation' => $activitedeformation,
            'form' => $form->createView(),
        ));
    }*/

    /**
     * Finds and displays a Activitedeformation entity.
     *
     */
   /* public function showAction(Activitedeformation $activitedeformation)
    {
        $deleteForm = $this->createDeleteForm($activitedeformation);

        return $this->render('activitedeformation/show.html.twig', array(
            'activitedeformation' => $activitedeformation,
            'delete_form' => $deleteForm->createView(),
        ));
    }*/

    /**
     * Displays a form to edit an existing Activitedeformation entity.
     *
     */
    /*public function editAction(Request $request, Activitedeformation $activitedeformation)
    {
        $deleteForm = $this->createDeleteForm($activitedeformation);
        $editForm = $this->createForm('AppBundle\Form\ActivitedeformationType', $activitedeformation);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($activitedeformation);
            $em->flush();

            return $this->redirectToRoute('activitedeformation_edit', array('id' => $activitedeformation->getId()));
        }

        return $this->render('activitedeformation/edit.html.twig', array(
            'activitedeformation' => $activitedeformation,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
*/
    /**
     * Deletes a Activitedeformation entity.
     *
     */
   /* public function deleteAction(Request $request, Activitedeformation $activitedeformation)
    {
        $form = $this->createDeleteForm($activitedeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($activitedeformation);
            $em->flush();
        }

        return $this->redirectToRoute('activitedeformation_index');
    }*/

    /**
     * Creates a form to delete a Activitedeformation entity.
     *
     * @param Activitedeformation $activitedeformation The Activitedeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    /*private function createDeleteForm(Activitedeformation $activitedeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('activitedeformation_delete', array('id' => $activitedeformation->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }*/
}