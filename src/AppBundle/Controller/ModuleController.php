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
     * @Route("/module/{id}")
     * Accepts an id or the code of the module.
     */
    public function getModule($id)
    {
        $module = null;
        if(is_numeric($id)){
        $module = $this->getDoctrine()
            ->getRepository('AppBundle:Moduledeformation')
            ->find($id);
        }else{
            $product = $repository->findOneBy(
                array('code' => $id)
            );
        }

        if (!$module) {
            throw $this->createNotFoundException(
                'No module de formation found for id '.$id
            );
        }

        $html = $this->container->get('templating')->render(
            'module/unique.html.twig',
            array('number' => $module->getIntitule())
        );
        return new Response($html);
    }
}