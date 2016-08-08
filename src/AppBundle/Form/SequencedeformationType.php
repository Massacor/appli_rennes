<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class SequencedeformationType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $choices = $this->getModuleChoiceList($options);
        $builder
            ->add('moduleid', ChoiceType::class, array(
                'choices' => $choices,
                'disabled' => true,
            ))
            ->add('intitule')
            ->add('description')
            ->add('code')
            ->add('objectif')
            ->add('evaluation')
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Sequencedeformation'
        ));
        $resolver->setRequired('entity_manager');
    }

    /**
    * Function called for the form generation . Generating the Sequence drop down list.
    */
    private function getModuleChoiceList($options){
        $em = $options['entity_manager'];
        $modules = $em->getRepository('AppBundle:Moduledeformation')->findAll();

        $res = array();
        foreach ($modules as $key => $module) {
            $res[$module->getCode()] = $module->getId();
        }
        return $res; 
    }
}
