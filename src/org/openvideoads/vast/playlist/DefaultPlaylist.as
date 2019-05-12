package org.openvideoads.vast.playlist
{
    import org.openvideoads.base.Debuggable;
    import flash.net.URLLoader;
    import org.openvideoads.vast.schedule.StreamSequence;
    import org.openvideoads.vast.config.groupings.ProvidersConfigGroup;
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.vast.schedule.Stream;
    import flash.events.Event;
    import flash.events.ErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import flash.events.*;
    import flash.net.*;
    import flash.xml.*;

    public class DefaultPlaylist extends Debuggable implements _Str_4575 
    {
        protected var _Str_2519:Array;
        protected var _Str_2672:int = 0;
        protected var _Str_15511:int = 0;
        protected var _Str_3081:URLLoader = null;
        protected var _Str_20984:String = null;
        protected var _Str_17958:_Str_6835 = null;
        protected var _Str_7591:Boolean = false;

        public function DefaultPlaylist(k:StreamSequence=null, _arg_2:ProvidersConfigGroup=null, _arg_3:ProvidersConfigGroup=null)
        {
            this._Str_2519 = new Array();
            super();
            this._Str_25631(k, _arg_2, _arg_3);
        }

        protected function initialise():void
        {
            this._Str_2519 = new Array();
            this._Str_15511 = 0;
            this._Str_2672 = 0;
            this._Str_7591 = false;
        }

        public function _Str_25631(k:StreamSequence, _arg_2:ProvidersConfigGroup, _arg_3:ProvidersConfigGroup):void
        {
            var _local_4:int;
            var _local_5:_Str_3480;
            if (k != null)
            {
                _local_4 = 0;
                while (_local_4 < k.length)
                {
                    _local_5 = this.newPlaylistItem();
                    _local_5.index = _local_4;
                    _local_5.stream = k._Str_21989(_local_4);
                    if ((_local_5.stream is AdSlot))
                    {
                        if (!AdSlot(_local_5.stream).isInteractive())
                        {
                            _local_5.provider = ((_local_5.stream.isRTMP()) ? _arg_3.rtmpProvider : _arg_3.httpProvider);
                            _local_5.streamer = ((_local_5.stream.isRTMP()) ? _arg_3._Str_10294 : _arg_3._Str_10463);
                        }
                        _local_5.providers = _arg_3;
                    }
                    else
                    {
                        _local_5.provider = ((_local_5.stream.isRTMP()) ? _arg_2.rtmpProvider : _arg_2.httpProvider);
                        _local_5.streamer = ((_local_5.stream.isRTMP()) ? _arg_2._Str_10294 : _arg_2._Str_10463);
                        _local_5.providers = _arg_2;
                    }
                    this._Str_2519.push(_local_5);
                    _local_4++;
                }
            }
        }

        public function _Str_25970():Boolean
        {
            if (this.length > 0)
            {
                return (this._Str_11606(0).loadOnDemand) && (this._Str_11606(0)._Str_10174());
            }
            return false;
        }

        public function _Str_24195():Boolean
        {
            if (this.length > 0)
            {
                return this._Str_11606(0).isInteractive();
            }
            return false;
        }

        public function _Str_24277(k:Stream, _arg_2:int):void
        {
            if (((_arg_2 >= 0) && (_arg_2 < this._Str_2519.length)))
            {
                this._Str_2519[_arg_2].stream = k;
            }
        }

        public function _Str_16925(k:String, _arg_2:_Str_6835=null):void
        {
            this._Str_17958 = _arg_2;
            this._Str_3081 = new URLLoader();
            this._Str_3081.addEventListener(Event.COMPLETE, this._Str_13562);
            this._Str_3081.addEventListener(ErrorEvent.ERROR, this.errorHandler);
            this._Str_3081.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.errorHandler);
            this._Str_3081.addEventListener(IOErrorEvent.IO_ERROR, this.errorHandler);
            this._Str_3081.load(new URLRequest(k));
        }

        protected function _Str_19142():void
        {
            if (this._Str_17958 != null)
            {
                this._Str_17958._Str_16701(this);
            }
        }

        protected function _Str_13562(k:Event):void
        {
            this._Str_20984 = this._Str_3081.data;
            this.loadFromString(this._Str_20984);
            this._Str_19142();
        }

        protected function errorHandler(k:Event):void
        {
            this._Str_19142();
        }

        public function loadFromString(k:String):void
        {
        }

        public function _Str_11606(k:int):_Str_3480
        {
            if (this.length > k)
            {
                return this._Str_2519[k];
            }
            return null;
        }

        public function get length():int
        {
            return this._Str_2519.length;
        }

        public function playlist():Array
        {
            return this._Str_2519;
        }

        public function newPlaylistItem():_Str_3480
        {
            return new DefaultPlaylistItem();
        }

        public function _Str_21786(k:_Str_3480):void
        {
            this._Str_2519.push(k);
        }

        public function _Str_26029():Boolean
        {
            return this._Str_7591;
        }

        public function rewind():void
        {
            var k:int;
            this._Str_2672 = 0;
            this._Str_7591 = true;
            if (this._Str_2519 != null)
            {
                k = 0;
                while (k < this._Str_2519.length)
                {
                    this._Str_2519[k].rewind();
                    k++;
                }
            }
        }

        public function reset():void
        {
            var k:int;
            this._Str_2672 = 0;
            if (this._Str_2519 != null)
            {
                k = 0;
                while (k < this._Str_2519.length)
                {
                    this._Str_2519[k].reset();
                    k++;
                }
            }
        }

        public function get _Str_24840():int
        {
            return this._Str_15511;
        }

        public function get _Str_23049():int
        {
            return this._Str_2672;
        }

        public function _Str_23946(k:int=-1, _arg_2:Boolean=false):XML
        {
            var _local_3:int;
            var _local_4:String;
            if (this._Str_2519 != null)
            {
                _local_3 = ((this._Str_2672 > 0) ? (this._Str_2672 - 1) : 0);
                if (_local_3 < this._Str_2519.length)
                {
                    if (k > -1)
                    {
                        this._Str_2519[_local_3].overrideStartTimeSeconds = k;
                    }
                    _local_4 = this.header();
                    _local_4 = (_local_4 + this._Str_2519[_local_3].toString(_arg_2));
                    _local_4 = (_local_4 + this.footer());
                    return new XML(_local_4);
                }
            }
            return null;
        }

        public function _Str_26276(k:int=-1, _arg_2:Boolean=false):_Str_3480
        {
            var _local_3:int;
            if (this._Str_2519 != null)
            {
                _local_3 = ((this._Str_2672 > 0) ? (this._Str_2672 - 1) : 0);
                if (_local_3 < this._Str_2519.length)
                {
                    if (k > -1)
                    {
                        this._Str_2519[_local_3].overrideStartTimeSeconds = k;
                    }
                    return this._Str_2519[_local_3];
                }
            }
            return null;
        }

        public function _Str_18453(k:Boolean=false, _arg_2:Boolean=true):String
        {
            var _local_3:String;
            if (this._Str_2519 != null)
            {
                if (((this._Str_2672 > 0) && (_arg_2)))
                {
                    this._Str_7591 = false;
                }
                if (this._Str_2672 < this._Str_2519.length)
                {
                    this._Str_15511 = this._Str_2672;
                    if (this._Str_2519[this._Str_2672].canPlay())
                    {
                        _local_3 = this.header();
                        _local_3 = (_local_3 + this._Str_2519[this._Str_2672].toString(k));
                        this._Str_2519[this._Str_2672].markAsPlayed();
                        _local_3 = (_local_3 + this.footer());
                        this._Str_2672++;
                        return _local_3;
                    }
                    this._Str_2672++;
                    return this._Str_18453(k, false);
                }
            }
            return null;
        }

        public function _Str_22737(k:Boolean=false):XML
        {
            var _local_2:String = this._Str_18453(k);
            if (_local_2 != null)
            {
                return new XML(_local_2);
            }
            return null;
        }

        public function _Str_24342(k:Boolean=false, _arg_2:Boolean=true):_Str_3480
        {
            if (this._Str_2519 != null)
            {
                if (((this._Str_2672 > 0) && (_arg_2)))
                {
                    this._Str_7591 = false;
                }
                if (this._Str_2672 < this._Str_2519.length)
                {
                    this._Str_15511 = this._Str_2672;
                    if (this._Str_2519[this._Str_2672].canPlay())
                    {
                        this._Str_2519[this._Str_2672].markAsPlayed();
                        this._Str_2672++;
                        return this._Str_2519[(this._Str_2672 - 1)];
                    }
                    this._Str_2672++;
                    return this._Str_24342(k, false);
                }
            }
            return null;
        }

        public function _Str_18213(k:Boolean=false):String
        {
            var _local_2:String;
            this._Str_7591 = false;
            if (this._Str_2519 != null)
            {
                if (this._Str_2672 >= 0)
                {
                    if (this._Str_2519[this._Str_2672].canPlay())
                    {
                        _local_2 = this.header();
                        _local_2 = (_local_2 + this._Str_2519[this._Str_2672].toString(k));
                        this._Str_2519[this._Str_2672].markAsPlayed();
                        _local_2 = (_local_2 + this.footer());
                        this._Str_2672--;
                        return _local_2;
                    }
                    this._Str_2672--;
                    return this._Str_18213(k);
                }
            }
            return null;
        }

        public function _Str_22903(k:Boolean=false):XML
        {
            var _local_2:String = this._Str_18213(k);
            if (_local_2 != null)
            {
                return new XML(_local_2);
            }
            return null;
        }

        public function _Str_25316(k:Boolean=false):_Str_3480
        {
            this._Str_7591 = false;
            if (this._Str_2519 != null)
            {
                if (this._Str_2672 >= 0)
                {
                    if (this._Str_2519[this._Str_2672].canPlay())
                    {
                        this._Str_2519[this._Str_2672].markAsPlayed();
                        this._Str_2672--;
                        return this._Str_2519[(this._Str_2672 + 1)];
                    }
                    this._Str_2672--;
                    return this._Str_25316(k);
                }
            }
            return null;
        }

        public function getModel():Array
        {
            return this._Str_2519;
        }

        public function _Str_23134(k:Boolean=false):XML
        {
            return new XML(this.toString(k));
        }

        protected function header():String
        {
            return new String();
        }

        protected function footer():String
        {
            return new String();
        }

        public function _Str_10087():Array
        {
            var k:Array = new Array();
            var _local_2:int;
            while (_local_2 < this._Str_2519.length)
            {
                k.push(this._Str_2519[_local_2].toShowStreamConfigObject());
                _local_2++;
            }
            return k;
        }

        public function toShortString(k:Boolean=false):String
        {
            return this.toString(k);
        }

        public function toString(k:Boolean=false):String
        {
            var _local_2:String = new String();
            var _local_3:int;
            while (_local_3 < this._Str_2519.length)
            {
                _local_2 = (_local_2 + this._Str_2519[_local_3].toString(k));
                _local_3++;
            }
            return _local_2;
        }
    }
}
