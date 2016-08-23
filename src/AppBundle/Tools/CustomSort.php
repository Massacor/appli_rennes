<?php

namespace AppBundle\Tools;
/**
* 
*/
class CustomSort
{
	
    public $field = '';

    public function cmp($a, $b)
    {
        /**
         * field for order is in a class variable $field
         * using getter function with naming convention getVariable() we set first letter to uppercase
         * we use variable variable names - $a->{'varName'} would directly access a field
         */
        return strcmp($a->{'get'.ucfirst($this->field)}(), $b->{'get'.ucfirst($this->field)}());
    }

    public function sortObjectArrayByField($array, $field)
    {
        $this->field = $field;
        usort($array, array("AppBundle\Tools\CustomSort", "cmp"));;
        return $array;
    }
}