<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Doctrine\ORM\EntityRepository;

class ActivitedeformationType extends AbstractType
{

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $moduleId = $options['attr']['moduleid'];
        $builder
            ->add('sequenceid', EntityType::class, array(
                'class' => 'AppBundle:Sequencedeformation',
                'choice_label' => 'code',
                'choice_value' => 'id',
                'label' => 'Séquence',
                'query_builder' => function (EntityRepository $er) use ($moduleId) {
                                        return $er->createQueryBuilder('s')
                                            ->where('s.moduleid = ?1')
                                            ->setParameter(1, $moduleId);
                                    }
            ))
            ->add('intitule')
            ->add('code')
            ->add('description')
            ->add('objectifformateur')
            ->add('objectifapprenant')
            ->add('temps')
            ->add('demarche', ChoiceType::class, array(
                'choices'  => array(
                    'Inductive' => 1,
                    'Déductive' => 0,
                )
            ))
            ->add('evaluation', ChoiceType::class, array(
                'choices'  => array(
                    'Auto-Evaluation' => 'auto_eval',
                    'Continue' => 'continue',
                    'Ponctuelle' =>  'ponctuelle',
                    'Sommative' =>  'sommative',
                ),
                'required' => false,
            ))
            ->add('pos');
        

    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {

        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Activitedeformation',
            'attr' => array('moduleid' => null),
        ));
    }
}
