<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Urldeformation;
use AppBundle\Form\UrldeformationType;
use AppBundle\Entity\Programmedeformation;
use AppBundle\Entity\Moduledeformation;
use AppBundle\Entity\Sequencedeformation;
use AppBundle\Entity\Activitedeformation;

/**
 * Urldeformation controller.
 *
 * @Route("/urldeformation")
 */
class UrldeformationController extends Controller
{
    /**
     * Lists all Urldeformation entities.
     *
     * @Route("/", name="urldeformation_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $urldeformations = $em->getRepository('AppBundle:Urldeformation')->findAll();

        return $this->render('urldeformation/index.html.twig', array(
            'urldeformations' => $urldeformations,
        ));
    }

    /**
     * Creates a new Urldeformation entity.
     *
     * @Route("/new", name="urldeformation_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $urldeformation = new Urldeformation();
        if ($request->query->has('actid'))
            $urldeformation->setActivityid($request->query->get('actid'));
        $form = $this->createForm('AppBundle\Form\UrldeformationType', $urldeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($urldeformation);
            $em->flush();

            $actid = $urldeformation->getActivityId();
            $activity = $em->getRepository('AppBundle:Activitedeformation')->findBy(array(
                "id" => $actid
            ))[0];
            $seqid = $activity->getSequenceId();
            $sequence = $em->getRepository('AppBundle:Sequencedeformation')->findBy(array(
                "id" => $seqid
            ))[0];
            $modid = $sequence->getModuleId()->getId();
            $progid = $em->getRepository('AppBundle:Linkprogrammemodule')->findBy(array(
                'moduleid' => $modid
            ))[0]->getProgrammeid()->getId();

            return $this->redirectToRoute('activite_show', array(
                'actid' => $actid,
                'seqid' => $seqid,
                'modid' => $modid,
                'progid' => $progid
            ));
        }

        return $this->render('urldeformation/new.html.twig', array(
            'urldeformation' => $urldeformation,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Urldeformation entity.
     *
     * @Route("/{id}", name="urldeformation_show")
     * @Method("GET")
     */
    public function showAction(Urldeformation $urldeformation)
    {
        $deleteForm = $this->createDeleteForm($urldeformation);

        return $this->render('urldeformation/show.html.twig', array(
            'urldeformation' => $urldeformation,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Urldeformation entity.
     *
     * @Route("/{id}/edit", name="urldeformation_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Urldeformation $urldeformation)
    {
        $deleteForm = $this->createDeleteForm($urldeformation);
        $editForm = $this->createForm('AppBundle\Form\UrldeformationType', $urldeformation);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($urldeformation);
            $em->flush();

            return $this->redirectToRoute('urldeformation_edit', array('id' => $urldeformation->getId()));
        }

        return $this->render('urldeformation/edit.html.twig', array(
            'urldeformation' => $urldeformation,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Urldeformation entity.
     *
     * @Route("/{id}", name="urldeformation_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Urldeformation $urldeformation)
    {
        $form = $this->createDeleteForm($urldeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($urldeformation);
            $em->flush();
        }

        return $this->redirectToRoute('urldeformation_index');
    }

    /**
     * Creates a form to delete a Urldeformation entity.
     *
     * @param Urldeformation $urldeformation The Urldeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Urldeformation $urldeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('urldeformation_delete', array('id' => $urldeformation->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
