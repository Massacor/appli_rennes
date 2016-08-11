<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Outildeformation;
use AppBundle\Entity\Linkactiviteoutil;
use AppBundle\Entity\Activitedeformation;
use AppBundle\Entity\Programmedeformation;
use AppBundle\Form\OutildeformationType;

/**
 * Outildeformation controller.
 *
 * @Route("/outil")
 */
class OutildeformationController extends Controller
{
    /**
     * Lists all Outildeformation entities.
     *
     * @Route("/{progid}/{actid}", name="outil_index")
     * @Method("GET")
     */
    public function indexAction(Programmedeformation $progid, Activitedeformation $actid)
    {
        
        $em = $this->getDoctrine()->getManager();

        $outildeformations = $em->getRepository('AppBundle:Outildeformation')->findAll();

        return $this->render('outildeformation/index.html.twig', array(
            'outildeformations' => $outildeformations,
            'activity' => $actid,
            'program' => $progid,
        ));
    }

    /**
     * Creates a new linkActiviteOutil entity.
     *
     * @Route("/{id}/link/{progid}/{activiteid}", name="outil_link")
     * @Method({"GET", "POST"})
     */
    public function linkAction(Request $request,Outildeformation $id, Programmedeformation $progid, Activitedeformation $activiteid){
        $em = $this->getDoctrine()->getManager();
        $links = $em->getRepository('AppBundle:Linkactiviteoutil')->findBy(array(
            "outilid" => $id,
            "activiteid" => $activiteid
            ));
        if(count($links)==0){
            $link = new Linkactiviteoutil();
            $link->setOutilid($id);
            $link->setActiviteid($activiteid);
            $em->persist($link);
            $em->flush();
        }
        else{
            $logger = $this->get('logger');
            $logger->info("Already existing link between Act[".$activiteid->getId()."] and Tool[".$id->getId()."]. Skipping link creation.");
        }
        return $this->redirectToRoute('activite_show', array(
            'actid' => $activiteid->getId(),
            'seqid' => $activiteid->getSequenceid()->getId(),
            'modid' => $activiteid->getSequenceid()->getModuleid()->getid(),
            'progid' => $progid->getId(),
        ));
    }

    
    /**
     * Deletes a linkActiviteOutil entity.
     *
     * @Route("/{id}/unlink/{progid}/{activiteid}", name="outil_unlink")
     * @Method({"GET", "POST"})
     */
    public function unlinkAction(Request $request,Outildeformation $id, Programmedeformation $progid, Activitedeformation $activiteid){
        $em = $this->getDoctrine()->getManager();

        $links = $em->getRepository('AppBundle:Linkactiviteoutil')->findBy(array(
            "outilid" => $id,
            "activiteid" => $activiteid
            ));
        if(count($links)>0){
            foreach ($links as $key => $link) {
               $em->remove($link);
            }
            
            $em->flush();
        }

        return $this->redirectToRoute('activite_show', array(
            'actid' => $activiteid->getId(),
            'seqid' => $activiteid->getSequenceid()->getId(),
            'modid' => $activiteid->getSequenceid()->getModuleid()->getid(),
            'progid' => $progid->getId(),
        ));
    }

    /**
     * Creates a new Outildeformation entity.
     *
     * @Route("/new", name="outil_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $outildeformation = new Outildeformation();
        $form = $this->createForm('AppBundle\Form\OutildeformationType', $outildeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($outildeformation);

            if(isset($_GET['activiteid'])){
                $activiteid = $_GET['activiteid'];
                $link = new Linkactiviteoutil();
                $link->setOutilid($outildeformation);
                $link->setActiviteid($activiteid);
                $em->persist($link);
            }
            $em->flush();

            return $this->redirectToRoute('outil_show', array('id' => $outildeformation->getId()));
        }

        return $this->render('outildeformation/new.html.twig', array(
            'outildeformation' => $outildeformation,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Outildeformation entity.
     *
     * @Route("/{id}", name="outil_show")
     * @Method("GET")
     */
    public function showAction(Outildeformation $outildeformation)
    {
        $deleteForm = $this->createDeleteForm($outildeformation);
        return $this->render('outildeformation/show.html.twig', array(
            'outildeformation' => $outildeformation,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Outildeformation entity.
     *
     * @Route("/{id}/edit", name="outil_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Outildeformation $outildeformation)
    {
        $deleteForm = $this->createDeleteForm($outildeformation);
        $editForm = $this->createForm('AppBundle\Form\OutildeformationType', $outildeformation);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($outildeformation);
            $em->flush();

            return $this->redirectToRoute('outil_edit', array('id' => $outildeformation->getId()));
        }

        return $this->render('outildeformation/edit.html.twig', array(
            'outildeformation' => $outildeformation,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Outildeformation entity.
     *
     * @Route("/{id}", name="outil_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Outildeformation $outildeformation)
    {
        $form = $this->createDeleteForm($outildeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($outildeformation);
            $em->flush();
        }

        return $this->redirectToRoute('outil_index');
    }

    /**
     * Creates a form to delete a Outildeformation entity.
     *
     * @param Outildeformation $outildeformation The Outildeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Outildeformation $outildeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('outil_delete', array('id' => $outildeformation->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
