<?php

use Symfony\Component\Routing\RouteCollection;
use Symfony\Component\Routing\Route;

$collection = new RouteCollection();

$collection->add('activitedeformation_index', new Route(
    '/',
    array('_controller' => 'AppBundle:Activitedeformation:index'),
    array(),
    array(),
    '',
    array(),
    array('GET')
));

$collection->add('activitedeformation_show', new Route(
    '/{id}/show',
    array('_controller' => 'AppBundle:Activitedeformation:show'),
    array(),
    array(),
    '',
    array(),
    array('GET')
));

$collection->add('activitedeformation_new', new Route(
    '/new',
    array('_controller' => 'AppBundle:Activitedeformation:new'),
    array(),
    array(),
    '',
    array(),
    array('GET', 'POST')
));

$collection->add('activitedeformation_edit', new Route(
    '/{id}/edit',
    array('_controller' => 'AppBundle:Activitedeformation:edit'),
    array(),
    array(),
    '',
    array(),
    array('GET', 'POST')
));

$collection->add('activitedeformation_delete', new Route(
    '/{id}/delete',
    array('_controller' => 'AppBundle:Activitedeformation:delete'),
    array(),
    array(),
    '',
    array(),
    array('DELETE')
));

return $collection;
