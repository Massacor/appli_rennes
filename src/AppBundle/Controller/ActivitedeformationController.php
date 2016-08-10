<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Activitedeformation;
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
     * @Route("/", name="activite_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem("Modules index", $this->get("router")->generate("module_index"));
        $breadcrumbs->addItem("Sequence index", $this->get("router")->generate("sequence_index"));
        $breadcrumbs->addItem("Activity index", $this->get("router")->generate("sequence_index"));

        $em = $this->getDoctrine()->getManager();

        $activitedeformations = $em->getRepository('AppBundle:Activitedeformation')->findAll();

        return $this->render('activitedeformation/index.html.twig', array(
            'activitedeformations' => $activitedeformations,
        ));
    }

    /**
     * Creates a new Activitedeformation entity.
     *
     * @Route("/new", name="activite_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $logger = $this->get('logger');
        $activitedeformation = new Activitedeformation();

         // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));

        
        if(isset($_GET['sequenceid'])){
            $sequencedeformation = $this->get('doctrine.orm.entity_manager')->getRepository('AppBundle:Sequencedeformation')->find($_GET['sequenceid']);

            // Predefine values
            $activitedeformation->setSequenceid($sequencedeformation);
            $activitedeformation->setCode($sequencedeformation->getCode().'-');

            //Manage Breadcrumb
            $breadcrumbs->addItem($activitedeformation->getSequenceid()->getModuleid(), $this->get("router")->generate("module_show", array("id"=> $activitedeformation->getSequenceid()->getModuleid()->getId())));
            $breadcrumbs->addItem($activitedeformation->getSequenceid(), $this->get("router")->generate("sequence_show", array("id"=> $activitedeformation->getSequenceid()->getId())));

        }
        else{
             $logger->error('Missing Sequence ID in GET parameters');
        }
        $breadcrumbs->addItem("New activity");

        $form = $this->createForm('AppBundle\Form\ActivitedeformationType', $activitedeformation);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($activitedeformation);
            $em->flush();

            return $this->redirectToRoute('activite_show', array('id' => $activitedeformation->getId()));
        }

        return $this->render('activitedeformation/new.html.twig', array(
            'activitedeformation' => $activitedeformation,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Activitedeformation entity.
     *
     * @Route("/{id}", name="activite_show")
     * @Method("GET")
     */
    public function showAction(Activitedeformation $activitedeformation)
    {

        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem($activitedeformation->getSequenceid()->getModuleid(), $this->get("router")->generate("module_show", array('id'=>$activitedeformation->getSequenceid()->getModuleid()->getId())));
        $breadcrumbs->addItem($activitedeformation->getSequenceid(), $this->get("router")->generate("sequence_show", array("id"=> $activitedeformation->getSequenceid()->getId())));
        $breadcrumbs->addItem($activitedeformation->getCode(), $this->get("router")->generate("activite_show", array("id"=> $activitedeformation->getId())));

        $deleteForm = $this->createDeleteForm($activitedeformation);

        $em = $this->getDoctrine()->getManager();
        $links = $em->getRepository('AppBundle:Linkactiviteoutil')->findBy(array(
            "activiteid" => $activitedeformation->getId()
        ));

        $tools = array();
        foreach ($links as $key => $link) {
           array_push($tools , $em->getRepository('AppBundle:Outildeformation')->find($link->getOutilid()));
        }
        return $this->render('activitedeformation/show.html.twig', array(
            'activitedeformation' => $activitedeformation,
            'outils' => $tools,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Activitedeformation entity.
     *
     * @Route("/{id}/edit", name="activite_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Activitedeformation $activitedeformation)
    {

        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem($activitedeformation->getSequenceid()->getModuleid(), $this->get("router")->generate("module_show", array('id'=>$activitedeformation->getSequenceid()->getModuleid()->getId())));
        $breadcrumbs->addItem($activitedeformation->getSequenceid(), $this->get("router")->generate("sequence_show", array("id"=> $activitedeformation->getSequenceid()->getId())));
        $breadcrumbs->addItem($activitedeformation->getCode(), $this->get("router")->generate("activite_show", array("id"=> $activitedeformation->getId())));

        $deleteForm = $this->createDeleteForm($activitedeformation);
        $editForm = $this->createForm('AppBundle\Form\ActivitedeformationType', $activitedeformation);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($activitedeformation);
            $em->flush();

            return $this->redirectToRoute('activite_edit', array('id' => $activitedeformation->getId()));
        }

        return $this->render('activitedeformation/edit.html.twig', array(
            'activitedeformation' => $activitedeformation,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Activitedeformation entity.
     *
     * @Route("/{id}", name="activite_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Activitedeformation $activitedeformation)
    {

        // Manage Breadcrumbs
        $breadcrumbs = $this->get("white_october_breadcrumbs");
        $breadcrumbs->addItem("Home", $this->get("router")->generate("homepage"));
        $breadcrumbs->addItem($activitedeformation->getSequenceid()->getModuleid(), $this->get("router")->generate("module_show", array('id'=>$activitedeformation->getSequenceid()->getModuleid()->getId())));
        $breadcrumbs->addItem($activitedeformation->getSequenceid(), $this->get("router")->generate("sequence_show", array("id"=> $activitedeformation->getSequenceid()->getId())));
        $breadcrumbs->addItem($activitedeformation->getCode(), $this->get("router")->generate("activite_show", array("id"=> $activitedeformation->getId())));

        $form = $this->createDeleteForm($activitedeformation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($activitedeformation);
            $em->flush();
        }

        return $this->redirectToRoute('activite_index');
    }

    /**
     * Creates a form to delete a Activitedeformation entity.
     *
     * @param Activitedeformation $activitedeformation The Activitedeformation entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Activitedeformation $activitedeformation)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('activite_delete', array('id' => $activitedeformation->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
