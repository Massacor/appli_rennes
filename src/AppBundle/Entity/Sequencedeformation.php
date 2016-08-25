<?php

namespace AppBundle\Entity;

/**
 * Sequencedeformation
 */
class Sequencedeformation
{
    /**
     * @var string
     */
    private $intitule;

    /**
     * @var string
     */
    private $description;

    /**
     * @var string
     */
    private $code;

    /**
     * @var string
     */
    private $objectif;

    /**
     * @var boolean
     */
    private $evaluation;

    /**
     * @var integer
     */
    private $id;


    /*
    *    FIXME
    *    Magic function. used in the forms for getting the id instead of {}
    */
    public function __toString()
    {
        return $this->id."";
    }
    /**
     * Set intitule
     *
     * @param string $intitule
     *
     * @return Sequencedeformation
     */
    public function setIntitule($intitule)
    {
        $this->intitule = $intitule;

        return $this;
    }

    /**
     * Get intitule
     *
     * @return string
     */
    public function getIntitule()
    {
        return $this->intitule;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Sequencedeformation
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set code
     *
     * @param string $code
     *
     * @return Sequencedeformation
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set objectif
     *
     * @param string $objectif
     *
     * @return Sequencedeformation
     */
    public function setObjectif($objectif)
    {
        $this->objectif = $objectif;

        return $this;
    }

    /**
     * Get objectif
     *
     * @return string
     */
    public function getObjectif()
    {
        return $this->objectif;
    }

    /**
     * Set evaluation
     *
     * @param boolean $evaluation
     *
     * @return Sequencedeformation
     */
    public function setEvaluation($evaluation)
    {
        $this->evaluation = $evaluation;

        return $this;
    }

    /**
     * Get evaluation
     *
     * @return boolean
     */
    public function getEvaluation()
    {
        return $this->evaluation;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
    /**
     * @var integer
     */
    private $moduleid;


    /**
     * Set moduleid
     *
     * @param integer $moduleid
     *
     * @return Sequencedeformation
     */
    public function setModuleid($moduleid)
    {
        $this->moduleid = $moduleid;

        return $this;
    }

    /**
     * Get moduleid
     *
     * @return integer
     */
    public function getModuleid()
    {
        return $this->moduleid;
    }
    /**
     * @var integer
     */
    private $pos = '1';


    /**
     * Set pos
     *
     * @param integer $pos
     *
     * @return Sequencedeformation
     */
    public function setPos($pos)
    {
        $this->pos = $pos;

        return $this;
    }

    /**
     * Get pos
     *
     * @return integer
     */
    public function getPos()
    {
        return $this->pos;
    }
}
