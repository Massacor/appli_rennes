<?php

namespace AppBundle\Entity;

/**
 * Linkactiviteoutil
 */
class Linkactiviteoutil
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var \AppBundle\Entity\Outildeformation
     */
    private $outilid;

    /**
     * @var \AppBundle\Entity\Activitedeformation
     */
    private $activiteid;


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
     * Set outilid
     *
     * @param \AppBundle\Entity\Outildeformation $outilid
     *
     * @return Linkactiviteoutil
     */
    public function setOutilid(\AppBundle\Entity\Outildeformation $outilid = null)
    {
        $this->outilid = $outilid;

        return $this;
    }

    /**
     * Get outilid
     *
     * @return \AppBundle\Entity\Outildeformation
     */
    public function getOutilid()
    {
        return $this->outilid;
    }

    /**
     * Set activiteid
     *
     * @param \AppBundle\Entity\Activitedeformation $activiteid
     *
     * @return Linkactiviteoutil
     */
    public function setActiviteid(\AppBundle\Entity\Activitedeformation $activiteid = null)
    {
        $this->activiteid = $activiteid;

        return $this;
    }

    /**
     * Get activiteid
     *
     * @return \AppBundle\Entity\Activitedeformation
     */
    public function getActiviteid()
    {
        return $this->activiteid;
    }
}

