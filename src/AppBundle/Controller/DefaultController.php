<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Tools\CustomSort;

class DefaultController extends Controller
{

    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $programmedeformations = $em->getRepository('AppBundle:Programmedeformation')->findAll();
        $customSort = new CustomSort();
        $programmedeformations = $customSort->sortObjectArrayByField($programmedeformations, 'intitule');
        return $this->render('default/index.html.twig', array(
            'programmes' => $programmedeformations,
        ));
    }
}
