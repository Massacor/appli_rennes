<?php
namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class SequenceController  extends Controller
{
    /**
     * @Route("/sequences")
     */
    public function getSequences()
    {
        $sequences = $this->getDoctrine()
            ->getRepository('AppBundle:Sequencedeformation')
            ->findAll();

        $html = $this->container->get('templating')->render(
            'sequence/list.html.twig',
            array('sequences' => $sequences)
        );

        return new Response($html);
    }

    /**
     * @Route("/sequence/select/{id}")
     * Accepts an id or the code of the sequence.
     */
    public function getSequence($id)
    {
        $sequence = $this->getDoctrine()
            ->getRepository('AppBundle:Sequencedeformation')
            ->find($id);
     
        if (!$sequence) {
            throw $this->createNotFoundException(
                'No module de formation found for id '.$id
            );
        }

        //Get the related sequences
        $activites = $this->getDoctrine()
            ->getRepository('AppBundle:Activitedeformation')
            ->findBy(
                 array('sequenceid' => $sequence->getId())
            );

        $html = $this->container->get('templating')->render(
            'sequence/unique.html.twig',
            array(
                'number' => $sequence->getIntitule(), 
                'activites' => $activites
            )
        );
        return new Response($html);
    }
}