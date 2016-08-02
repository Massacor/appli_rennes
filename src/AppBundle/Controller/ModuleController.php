<?php
namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ModuleController  extends Controller
{
    /**
     * @Route("/modules")
     */
    public function getModules()
    {
        $modules = $this->getDoctrine()
            ->getRepository('AppBundle:Moduledeformation')
            ->findAll();

        $html = $this->container->get('templating')->render(
            'module/list.html.twig',
            array('modules' => $modules)
        );

        return new Response($html);
    }

    /**
     * @Route("/module/select/{id}")
     */
    public function getModule($id)
    {
        $module = $this->getDoctrine()
            ->getRepository('AppBundle:Moduledeformation')
            ->find($id);

        if (!$module) {
            throw $this->createNotFoundException(
                'No module de formation found for id '.$id
            );
        }

        //Get the related sequences
        $sequences = $this->getDoctrine()
            ->getRepository('AppBundle:Sequencedeformation')
            ->findBy(
                 array('moduleid' => $module->getId())
            );

        $html = $this->container->get('templating')->render(
            'module/unique.html.twig',
            array('intitule' => $module->getIntitule(),
                'sequences' => $sequences
            )
        );
        return new Response($html);
    }


}