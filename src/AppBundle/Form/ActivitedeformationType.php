<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class ActivitedeformationType extends AbstractType
{

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('sequenceid', EntityType::class, array(
                'class' => 'AppBundle:Sequencedeformation',
                'choice_label' => 'code',
                'choice_value' => 'id',
                'disabled' => true,
            ))
            ->add('intitule')
            ->add('code')
            ->add('description')
            ->add('objectifformateur')
            ->add('objectifapprenant')
            ->add('temps')
            ->add('demarche')
            ->add('evaluation')
        ;

    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {

        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Activitedeformation'
        ));
    }
}
