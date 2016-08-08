<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

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
            ->add('evaluation', ChoiceType::class, array(
                'choices'  => array(
                    'Auto-Evaluation' => 'auto_eval',
                    'Continue' => 'continue',
                    'Ponctuelle' =>  'ponctuelle',
                    'Sommative' =>  'sommative',
                ),
                'required' => false,
            ));
        

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
