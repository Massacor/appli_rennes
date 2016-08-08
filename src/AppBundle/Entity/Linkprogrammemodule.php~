<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Linkprogrammemodule
 *
 * @ORM\Table(name="linkProgrammeModule")
 * @ORM\Entity
 */
class Linkprogrammemodule
{
    /**
     * @var integer
     *
     * @ORM\Column(name="programmeId", type="integer", nullable=false)
     */
    private $programmeid;

    /**
     * @var integer
     *
     * @ORM\Column(name="moduleId", type="integer", nullable=false)
     */
    private $moduleid;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;



    /**
     * Set programmeid
     *
     * @param integer $programmeid
     *
     * @return Linkprogrammemodule
     */
    public function setProgrammeid($programmeid)
    {
        $this->programmeid = $programmeid;

        return $this;
    }

    /**
     * Get programmeid
     *
     * @return integer
     */
    public function getProgrammeid()
    {
        return $this->programmeid;
    }

    /**
     * Set moduleid
     *
     * @param integer $moduleid
     *
     * @return Linkprogrammemodule
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
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
}
