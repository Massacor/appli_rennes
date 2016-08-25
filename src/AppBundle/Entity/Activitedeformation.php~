<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Activitedeformation
 *
 * @ORM\Table(name="ActiviteDeFormation")
 * @ORM\Entity
 */
class Activitedeformation
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
     * @ORM\Column(name="code", type="string", length=20, nullable=false)
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
     * @ORM\Column(name="objectifFormateur", type="string", length=256, nullable=false)
     */
    private $objectifformateur;

    /**
     * @var string
     *
     * @ORM\Column(name="objectifApprenant", type="string", length=256, nullable=false)
     */
    private $objectifapprenant;

    /**
     * @var integer
     *
     * @ORM\Column(name="temps", type="integer", nullable=false)
     */
    private $temps;

    /**
     * @var boolean
     *
     * @ORM\Column(name="demarche", type="boolean", nullable=false)
     */
    private $demarche;

    /**
     * @var string
     *
     * @ORM\Column(name="evaluation", type="string", length=256, nullable=false)
     */
    private $evaluation;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;



    /**
     * Set intitule
     *
     * @param string $intitule
     *
     * @return Activitedeformation
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
     * Set code
     *
     * @param string $code
     *
     * @return Activitedeformation
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
     * @return Activitedeformation
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
     * Set objectifformateur
     *
     * @param string $objectifformateur
     *
     * @return Activitedeformation
     */
    public function setObjectifformateur($objectifformateur)
    {
        $this->objectifformateur = $objectifformateur;

        return $this;
    }

    /**
     * Get objectifformateur
     *
     * @return string
     */
    public function getObjectifformateur()
    {
        return $this->objectifformateur;
    }

    /**
     * Set objectifapprenant
     *
     * @param string $objectifapprenant
     *
     * @return Activitedeformation
     */
    public function setObjectifapprenant($objectifapprenant)
    {
        $this->objectifapprenant = $objectifapprenant;

        return $this;
    }

    /**
     * Get objectifapprenant
     *
     * @return string
     */
    public function getObjectifapprenant()
    {
        return $this->objectifapprenant;
    }

    /**
     * Set temps
     *
     * @param integer $temps
     *
     * @return Activitedeformation
     */
    public function setTemps($temps)
    {
        $this->temps = $temps;

        return $this;
    }

    /**
     * Get temps
     *
     * @return integer
     */
    public function getTemps()
    {
        return $this->temps;
    }

    /**
     * Set demarche
     *
     * @param boolean $demarche
     *
     * @return Activitedeformation
     */
    public function setDemarche($demarche)
    {
        $this->demarche = $demarche;

        return $this;
    }

    /**
     * Get demarche
     *
     * @return boolean
     */
    public function getDemarche()
    {
        return $this->demarche;
    }

    /**
     * Set evaluation
     *
     * @param string $evaluation
     *
     * @return Activitedeformation
     */
    public function setEvaluation($evaluation)
    {
        $this->evaluation = $evaluation;

        return $this;
    }

    /**
     * Get evaluation
     *
     * @return string
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
    private $sequenceid;


    /**
     * Set sequenceid
     *
     * @param integer $sequenceid
     *
     * @return Activitedeformation
     */
    public function setSequenceid($sequenceid)
    {
        $this->sequenceid = $sequenceid;

        return $this;
    }

    /**
     * Get sequenceid
     *
     * @return integer
     */
    public function getSequenceid()
    {
        return $this->sequenceid;
    }
}
