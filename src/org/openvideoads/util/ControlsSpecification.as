package org.openvideoads.util
{
    import org.openvideoads.base.Debuggable;

    public class ControlsSpecification extends Debuggable 
    {
        public static const PLAY:String = "PLAY";
        public static const PAUSE:String = "PAUSE";
        public static const STOP:String = "STOP";
        public static const PLAYLIST:String = "PLAYLIST";
        public static const TIME:String = "TIME";
        public static const VOLUME:String = "VOLUME";
        public static const MUTE:String = "MUTE";
        public static const FULLSCREEN:String = "FULLSCREEN";

        protected var _Str_17432:Boolean = true;
        protected var _Str_2500:Boolean = true;
        protected var _Str_2699:Boolean = false;
        protected var _Str_16538:Boolean = true;
        protected var _Str_16202:Boolean = true;
        protected var _Str_16043:Boolean = true;
        protected var _Str_16384:Boolean = false;
        protected var _Str_17436:Boolean = false;
        protected var _Str_18122:Boolean = true;
        protected var _Str_17845:Boolean = true;
        protected var _Str_18434:Boolean = true;
        protected var _height:int = -999;
        protected var _Str_21506:Boolean = false;
        protected var _Str_18977:Boolean = false;

        public function ControlsSpecification(k:Object=null)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object):void
        {
            if (k != null)
            {
                if (k.hasOwnProperty("manage"))
                {
                    this._Str_17432 = StringUtils._Str_2810(k.manage);
                }
                if (k.hasOwnProperty("visible"))
                {
                    this._Str_2500 = StringUtils._Str_2810(k.visible);
                }
                if (k.hasOwnProperty("enable"))
                {
                    this.enabled = StringUtils._Str_2810(k.enable);
                }
                if (this.enabled == false)
                {
                    if (k.hasOwnProperty("enablePlay"))
                    {
                        this._Str_16538 = StringUtils._Str_2810(k.enablePlay);
                    }
                    if (k.hasOwnProperty("enablePause"))
                    {
                        this._Str_16202 = StringUtils._Str_2810(k.enablePause);
                    }
                    if (k.hasOwnProperty("enableStop"))
                    {
                        this._Str_16043 = StringUtils._Str_2810(k.enableStop);
                    }
                    if (k.hasOwnProperty("enablePlaylist"))
                    {
                        this._Str_16384 = StringUtils._Str_2810(k.enablePlaylist);
                    }
                    if (k.hasOwnProperty("enableTime"))
                    {
                        this._Str_17436 = StringUtils._Str_2810(k.enableTime);
                    }
                    if (k.hasOwnProperty("enableVolume"))
                    {
                        this._Str_18122 = StringUtils._Str_2810(k.enableVolume);
                    }
                    if (k.hasOwnProperty("enableMute"))
                    {
                        this._Str_17845 = StringUtils._Str_2810(k.enableMute);
                    }
                    if (k.hasOwnProperty("enableFullscreen"))
                    {
                        this._Str_18434 = StringUtils._Str_2810(k.enableFullscreen);
                    }
                    if (k.hasOwnProperty("anchorNonLinearToBottom"))
                    {
                        this._Str_18977 = StringUtils._Str_2810(k.anchorNonLinearToBottom);
                    }
                }
                if (k.hasOwnProperty("hideDock"))
                {
                    this.hideDock = StringUtils._Str_2810(k.hideDock);
                }
                if (k.hasOwnProperty("height"))
                {
                    this.height = k.height;
                }
            }
        }

        public function _Str_25897():Boolean
        {
            return this._Str_2500;
        }

        public function controlEnabled(k:String):Boolean
        {
            if (k != null)
            {
                k = k.toUpperCase();
                if (k == ControlsSpecification.PLAY)
                {
                    return this.enablePlay;
                }
                if (k == ControlsSpecification.PAUSE)
                {
                    return this.enablePause;
                }
                if (k == ControlsSpecification.PLAYLIST)
                {
                    return this.enablePlaylist;
                }
                if (k == ControlsSpecification.TIME)
                {
                    return this.enableTime;
                }
                if (k == ControlsSpecification.VOLUME)
                {
                    return this.enableVolume;
                }
                if (k == ControlsSpecification.MUTE)
                {
                    return this.enableMute;
                }
                if (k == ControlsSpecification.STOP)
                {
                    return this.enableStop;
                }
                if (k == ControlsSpecification.FULLSCREEN)
                {
                    return this.enableFullscreen;
                }
            }
            return false;
        }

        public function set manage(k:Boolean):void
        {
            this._Str_17432 = k;
        }

        public function get manage():Boolean
        {
            if (this._Str_2699 == true)
            {
                return false;
            }
            return this._Str_17432;
        }

        public function set hideDock(k:Boolean):void
        {
            this._Str_21506 = k;
        }

        public function get hideDock():Boolean
        {
            return this._Str_21506;
        }

        public function set visible(k:Boolean):void
        {
            this._Str_2500 = k;
        }

        public function get visible():Boolean
        {
            return this._Str_2500;
        }

        public function set anchorNonLinearToBottom(k:Boolean):void
        {
            this._Str_18977 = k;
        }

        public function get anchorNonLinearToBottom():Boolean
        {
            return this._Str_18977;
        }

        public function set enabled(k:Boolean):void
        {
            this._Str_2699 = k;
            this.enablePlay = k;
            this.enablePause = k;
            this.enablePlaylist = k;
            this.enableTime = k;
            this.enableVolume = k;
            this.enableStop = k;
            this.enableFullscreen = k;
            this.enableMute = k;
        }

        public function get enabled():Boolean
        {
            return this._Str_2699;
        }

        public function set enablePlay(k:Boolean):void
        {
            this._Str_16538 = k;
        }

        public function get enablePlay():Boolean
        {
            return this._Str_16538;
        }

        public function set enablePause(k:Boolean):void
        {
            this._Str_16202 = k;
        }

        public function get enablePause():Boolean
        {
            return this._Str_16202;
        }

        public function set enableStop(k:Boolean):void
        {
            this._Str_16043 = k;
        }

        public function get enableStop():Boolean
        {
            return this._Str_16043;
        }

        public function set enablePlaylist(k:Boolean):void
        {
            this._Str_16384 = k;
        }

        public function get enablePlaylist():Boolean
        {
            return this._Str_16384;
        }

        public function set enableTime(k:Boolean):void
        {
            this._Str_17436 = k;
        }

        public function get enableTime():Boolean
        {
            return this._Str_17436;
        }

        public function set enableVolume(k:Boolean):void
        {
            this._Str_18122 = k;
        }

        public function get enableVolume():Boolean
        {
            return this._Str_18122;
        }

        public function set enableMute(k:Boolean):void
        {
            this._Str_17845 = k;
        }

        public function get enableMute():Boolean
        {
            return this._Str_17845;
        }

        public function set enableFullscreen(k:Boolean):void
        {
            this._Str_18434 = k;
        }

        public function get enableFullscreen():Boolean
        {
            return this._Str_18434;
        }

        public function set height(k:int):void
        {
            this._height = k;
        }

        public function get height():int
        {
            return this._height;
        }

        public function hasHeightSpecified():Boolean
        {
            return !(this._height == -999);
        }
    }
}
