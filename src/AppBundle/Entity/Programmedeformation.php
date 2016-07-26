<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Programmedeformation
 *
 * @ORM\Table(name="ProgrammeDeFormation")
 * @ORM\Entity
 */
class Programmedeformation
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
     * @return Programmedeformation
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
     * @return Programmedeformation
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
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
}
