<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Moduledeformation
 *
 * @ORM\Table(name="ModuleDeFormation")
 * @ORM\Entity
 */
class Moduledeformation
{
    /**
     * @var string
     *
     * @ORM\Column(name="intitule", type="string", length=256, nullable=false)
     */
    private $intitule;

    /**
     * @var string
     *
     * @ORM\Column(name="objectif", type="string", length=256, nullable=false)
     */
    private $objectif;

    /**
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=10, nullable=false)
     */
    private $code;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", length=65535, nullable=false)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="PreRequis", type="string", length=256, nullable=false)
     */
    private $prerequis;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;


    /*
    *    FIXME
    *    Magic function. used in the forms for getting the id instead of {}
    */
    public function __toString()
    {
        return $this->code;
    }

    /**
     * Set intitule
     *
     * @param string $intitule
     *
     * @return Moduledeformation
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
     * Set objectif
     *
     * @param string $objectif
     *
     * @return Moduledeformation
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
     * Set code
     *
     * @param string $code
     *
     * @return Moduledeformation
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
     * Set description
     *
     * @param string $description
     *
     * @return Moduledeformation
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
     * Set prerequis
     *
     * @param string $prerequis
     *
     * @return Moduledeformation
     */
    public function setPrerequis($prerequis)
    {
        $this->prerequis = $prerequis;

        return $this;
    }

    /**
     * Get prerequis
     *
     * @return string
     */
    public function getPrerequis()
    {
        return $this->prerequis;
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
    private $pos = '1';


    /**
     * Set pos
     *
     * @param integer $pos
     *
     * @return Moduledeformation
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
