<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\ChoiceList\ArrayChoiceList;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use AppBundle\Form\DataTransformer\SequenceToIdTransformer;

class ActivitedeformationType extends AbstractType
{

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $choices = $this->getSequenceChoiceList($options);
        $builder
            ->add('sequenceid', ChoiceType::class, array(
                'choices' => $choices,
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
        $resolver->setRequired('entity_manager');
    }

    /**
    * Function called for the form generation . Generating the Sequence drop down list.
    */
    private function getSequenceChoiceList($options){
        $em = $options['entity_manager'];
        $sequences = $em->getRepository('AppBundle:Sequencedeformation')->findAll();

        $res = array();
        foreach ($sequences as $key => $sequence) {
            $res[$sequence->getCode()] = $sequence->getId();
        }
        return $res; //new ArrayChoiceList($res);
    }
}
