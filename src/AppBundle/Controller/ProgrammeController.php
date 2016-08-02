<?php
namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ProgrammeController  extends Controller
{
    /**
     * @Route("/programmes")
     */
    public function getPrograms()
    {
        $programmes = $this->getDoctrine()
            ->getRepository('AppBundle:Programmedeformation')
            ->findAll();

        $html = $this->container->get('templating')->render(
            'programme/list.html.twig',
            array('programmes' => $programmes)
        );

        return new Response($html);
    }

    /**
     * @Route("/programme/select/{id}")
     */
    public function getProgram($id)
    {
        $programme = $this->getDoctrine()
            ->getRepository('AppBundle:Programmedeformation')
            ->find($id);

        if (!$programme) {
            throw $this->createNotFoundException(
                'No programme de formation found for id '.$id
            );
        }


        $linksToModules = $this->getDoctrine()
            ->getRepository('AppBundle:Linkprogrammemodule')
            ->findBy(
                 array('programmeid' => $programme->getId())
            );
        
        $modules = array();
		for($obj in $linksToModules){
			$toAdd = $this->getDoctrine()
	            ->getRepository('AppBundle:Moduledeformation')
	            ->find($obj->getModuleid());	

	        array_push($modules, $toAdd);
		}
		

        $html = $this->container->get('templating')->render(
            'programme/unique.html.twig',
            array('programme' => $programme,
                'sequences' => $modules
            )
        );
        return new Response($html);
    }


}