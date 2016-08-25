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
        $builder->add('moduleid', EntityType::class, array(
                'class' => 'AppBundle:Moduledeformation',
                'choice_label' => 'code',
                'choice_value' => 'id',
            ))
            ->add('intitule')
            ->add('description')
            ->add('code')
            ->add('objectif')
            ->add('evaluation')
            ->add('pos')
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
