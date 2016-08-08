<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class SequencedeformationType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            //->add('moduleid')
            ->add('moduleid', EntityType::class, array(
                // query choices from this entity
                'class' => 'AppBundle:Moduledeformation',

                // use the User.username property as the visible option string
                'label' => 'Module',
                'choice_label' => 'code',
                'choice_value' => 'id',
                'disabled'    => true,
                // used to render a select box, check boxes or radios
                // 'multiple' => true,
                // 'expanded' => true,
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
    }
}
