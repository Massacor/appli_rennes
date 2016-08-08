<?php

namespace AppBundle\Form\DataTransformer;

use AppBundle\Entity\Sequencedeformation;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Form\DataTransformerInterface;
use Symfony\Component\Form\Exception\TransformationFailedException;

class SequenceToIdTransformer implements DataTransformerInterface
{
	private $manager;

	public function __construct(ObjectManager $manager)
	{
		$this->manager = $manager;
	}

	    /**
	     * Transforms an Sequencedeformation to an id.
	     *
	     * @param  Object $obj
	     * @return string
	     */
	    public function transform($obj)
	    {
	    	if (null === $obj) {
	    		return '';
	    	}

	    	return $obj->getId();
	    }

	    /**
	     * Transforms a string (number) to an object (issue).
	     *
	     * @param  string $issueNumber
	     * @return Issue|null
	     * @throws TransformationFailedException if object (issue) is not found.
	     */
	    public function reverseTransform($issueNumber)
	    {
	        // no issue number? It's optional, so that's ok
	    	if (!$issueNumber) {
	    		return;
	    	}

	    	$issue = $this->manager
	    	->getRepository('AppBundle:Sequencedeformation')
	            // query for the issue with this id
	    	->find($issueNumber)
	    	;

	    	if (null === $issue) {
	            // causes a validation error
	            // this message is not shown to the user
	            // see the invalid_message option
	    		throw new TransformationFailedException(sprintf(
	    			'An issue with number "%s" does not exist!',
	    			$issueNumber
	    			));
	    	}

	    	return $issue;
	    }
}	
	   