<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $modules = $this->getDoctrine()
            ->getRepository('AppBundle:Moduledeformation')
            ->findAll();

        $html = $this->container->get('templating')->render(
            'default/index.html.twig',
            array('modules' => $modules)
        );
        return new Response($html);
    }
}
