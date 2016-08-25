<?php

namespace AppBundle\Entity;

/**
 * Urldeformation
 */
class Urldeformation
{
    /**
     * @var integer
     */
    private $activityid;

    /**
     * @var string
     */
    private $url;

    /**
     * @var integer
     */
    private $id;


    /**
     * Set activityid
     *
     * @param integer $activityid
     *
     * @return Urldeformation
     */
    public function setActivityid($activityid)
    {
        $this->activityid = $activityid;

        return $this;
    }

    /**
     * Get activityid
     *
     * @return integer
     */
    public function getActivityid()
    {
        return $this->activityid;
    }

    /**
     * Set url
     *
     * @param string $url
     *
     * @return Urldeformation
     */
    public function setUrl($url)
    {
        $this->url = $url;

        return $this;
    }

    /**
     * Get url
     *
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
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
     * @return Urldeformation
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
