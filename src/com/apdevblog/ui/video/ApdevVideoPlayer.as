package com.apdevblog.ui.video
{
    import flash.display.Sprite;
    import flash.media.Video;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.utils.Timer;
    import com.apdevblog.model.vo.VideoMetadataVo;
    import flash.display.DisplayObjectContainer;
    import com.apdevblog.ui.video.controls._Str_11881;
    import com.apdevblog.ui.video.controls.VideoControlsEvent;
    import com.apdevblog.utils._Str_3771;
    import flash.events.TimerEvent;
    import flash.events.NetStatusEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.AsyncErrorEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.StageDisplayState;
    import flash.events.FullScreenEvent;
    import flash.display.Stage;
    import flash.display.StageAlign;
    import flash.events.ErrorEvent;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.net.URLRequest;

    public class ApdevVideoPlayer extends Sprite 
    {
        public static const MIN_SIZE:int = 140;
        public static const _Str_17157:int = 2000;

        private var _Str_5336:Sprite;
        private var _Str_3878:Video;
        private var _Str_8304:NetConnection;
        private var _Str_3167:NetStream;
        private var _Str_13484:Timer;
        private var _Str_8436:Timer;
        private var _Str_11229:String;
        private var _Str_588:Number;
        private var _Str_23145:Number;
        private var _Str_11271:int;
        private var _Str_16691:String;
        private var _autoPlay:Boolean;
        private var _Str_4218:Boolean;
        private var _Str_22687:Number;
        private var _Str_8940:String;
        private var _Str_21382:VideoMetadataVo;
        private var _Str_3319:_Str_8021;
        private var _Str_3026:Number;
        private var _Str_4901:int;
        private var _Str_4960:int;
        private var _Str_18277:Boolean;
        private var _Str_11808:Boolean;
        private var _Str_20793:Boolean;
        private var _Str_16161:Boolean;
        private var _Str_18354:Boolean;
        private var _Str_19047:String;
        private var _Str_6957:Number;
        private var _Str_6961:Number;
        private var _Str_20927:DisplayObjectContainer;
        private var _Str_19777:int;
        private var _Str_12093:Timer;
        private var _Str_19802:int;
        private var _Str_8247:*;
        private var _Str_671:_Str_11881;
        private var _Str_18114:Boolean;

        public function ApdevVideoPlayer(k:int, _arg_2:int)
        {
            this._Str_1400(k, _arg_2);
        }

        public function clear():void
        {
            this.pause();
            this._Str_3878.clear();
            this._Str_3167.close();
            this._Str_3878.attachNetStream(null);
            this._Str_3878.visible = false;
            this._Str_3404 = _Str_2872.VIDEOSTATEEMPTY;
        }

        public function load(k:String):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_4245 = null;
            this._Str_11229 = k;
            if (((this._autoPlay) || (this._Str_18114)))
            {
                this._Str_3167.play(k);
                this._Str_3878.attachNetStream(this._Str_3167);
                this._Str_3878.visible = true;
                this._Str_4218 = true;
                this._Str_13484.start();
                this._Str_8436.start();
                this._Str_671.visible = false;
            }
        }

        public function pause():void
        {
            if (!this._Str_4218)
            {
                return;
            }
            this._Str_3167.pause();
            this._Str_8436.reset();
            this._Str_3404 = _Str_2872.VIDEOSTATEPAUSED;
            dispatchEvent(new VideoControlsEvent(_Str_2872.VIDEOSTATEPAUSED));
        }

        public function play():void
        {
            if (!this._Str_4218)
            {
                this._Str_18114 = true;
                this.load(this._Str_11229);
                return;
            }
            this._Str_671.visible = false;
            this._Str_3167.resume();
            this._Str_8436.start();
            this._Str_3404 = _Str_2872.VIDEOSTATEPLAYING;
        }

        public function seek(k:Number, _arg_2:Boolean=false):void
        {
            if (k < 0)
            {
                k = 0;
            }
            if (k > (this._Str_3167.bytesLoaded / this._Str_3167.bytesTotal))
            {
                k = (this._Str_3167.bytesLoaded / this._Str_3167.bytesTotal);
            }
            if (!_arg_2)
            {
                this._Str_11271 = 0;
            }
            else
            {
                this._Str_11271++;
            }
            if (this._Str_11271 == 1)
            {
                this._Str_16691 = this._Str_3404;
                if (((this._Str_3404 == _Str_2872.VIDEOSTATEPLAYING) || (this._Str_3404 == _Str_2872.VIDEOSTATESTOPPED)))
                {
                    this.pause();
                }
            }
            this._Str_3167.seek((k * this._Str_4245.duration));
            this._Str_3319._Str_12997(k);
            if (!_arg_2)
            {
                if (((this._Str_16691 == _Str_2872.VIDEOSTATEPLAYING) || (this._Str_16691 == _Str_2872.VIDEOSTATESTOPPED)))
                {
                    this.play();
                }
            }
        }

        public function getPosition():Number
        {
            var k:Number = 0;
            if (((!(this._Str_3167 == null)) && (!(this._Str_4245 == null))))
            {
                k = (this._Str_3167.time / this._Str_4245.duration);
            }
            return k;
        }

        public function _Str_26444(k:Object):void
        {
            if (this._Str_4245 == null)
            {
                this._Str_4245 = new VideoMetadataVo(k);
                if (((!(isNaN(this._Str_4245.width))) && (!(isNaN(this._Str_4245.height)))))
                {
                    this._Str_16733(this._Str_4901, this._Str_4960);
                }
            }
        }

        private function _Str_4149():void
        {
            this._Str_5336 = new Sprite();
            this._Str_5336.addChild(_Str_3771._Str_13333(this._Str_9635, this._Str_5932, 90, 3748644, 0, 1, 1));
            addChild(this._Str_5336);
            this._Str_3878 = new Video(this._Str_9635, this._Str_5932);
            this._Str_3878.smoothing = true;
            addChild(this._Str_3878);
            this._Str_3319 = new _Str_8021(this._Str_9635);
            this._Str_14540 = false;
            addChild(this._Str_3319);
            this._Str_671 = new _Str_11881(this._Str_9635, this._Str_5932);
            this._Str_671.visible = false;
            addChild(this._Str_671);
        }

        private function _Str_1400(k:int, _arg_2:int):void
        {
            var _local_3:Number;
            this._Str_22687 = 0;
            this._Str_588 = 0;
            this._Str_23145 = 0;
            this._Str_11271 = 0;
            this._autoPlay = false;
            this._Str_18114 = false;
            this._Str_18354 = (this._Str_16161 = false);
            if (k < ApdevVideoPlayer.MIN_SIZE)
            {
                _local_3 = ((_arg_2 > 0) ? (k / _arg_2) : (4 / 3));
                this._Str_4901 = ApdevVideoPlayer.MIN_SIZE;
                this._Str_4960 = (ApdevVideoPlayer.MIN_SIZE / _local_3);
            }
            else
            {
                this._Str_4901 = k;
                this._Str_4960 = _arg_2;
            }
            this._Str_4149();
            this._Str_3404 = _Str_2872.VIDEOSTATEEMPTY;
            this._Str_13484 = new Timer(500);
            this._Str_13484.addEventListener(TimerEvent.TIMER, this._Str_22266, false, 0, true);
            this._Str_8436 = new Timer(100);
            this._Str_8436.addEventListener(TimerEvent.TIMER, this._Str_23017, false, 0, true);
            this._Str_16581 = ApdevVideoPlayer._Str_17157;
            this._Str_12093 = new Timer(this._Str_16581, 1);
            this._Str_12093.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_24752, false, 0, true);
            this._Str_8304 = new NetConnection();
            this._Str_8304.addEventListener(NetStatusEvent.NET_STATUS, this._Str_20451, false, 0, true);
            this._Str_8304.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onError, false, 0, true);
            this._Str_8304.addEventListener(AsyncErrorEvent.ASYNC_ERROR, this.onError, false, 0, true);
            this._Str_8304.connect(null);
            addEventListener(VideoControlsEvent.SEEK, this._Str_21626, false, 0, true);
            addEventListener(VideoControlsEvent.SCRUB, this._Str_21626, false, 0, true);
            addEventListener(VideoControlsEvent.TOGGLEPLAYPAUSE, this._Str_23562, false, 0, true);
            addEventListener(VideoControlsEvent.SETVOLUME, this._Str_23756, false, 0, true);
            addEventListener(VideoControlsEvent.ENTERFULLSCREEN, this._Str_23232, false, 0, true);
            this._Str_5336.buttonMode = true;
            this._Str_5336.doubleClickEnabled = true;
            this._Str_5336.addEventListener(MouseEvent.CLICK, this._Str_23822, false, 0, true);
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage, false, 0, true);
        }

        private function _Str_23773():void
        {
            this._Str_3167 = new NetStream(this._Str_8304);
            this._Str_3167.addEventListener(NetStatusEvent.NET_STATUS, this._Str_20451, false, 0, true);
            this._Str_3167.addEventListener(IOErrorEvent.IO_ERROR, this.onError, false, 0, true);
            this._Str_3167.addEventListener(AsyncErrorEvent.ASYNC_ERROR, this._Str_23806, false, 0, true);
            this._Str_3167.bufferTime = 5;
            this._Str_3167.client = this;
        }

        private function _Str_16733(k:Number, _arg_2:Number):void
        {
            var _local_3:Number = (this._Str_4245.width / this._Str_4245.height);
            var _local_4:Number = (k / _arg_2);
            if (_local_3 > _local_4)
            {
                this._Str_3878.width = k;
                this._Str_3878.height = (k / _local_3);
            }
            else
            {
                this._Str_3878.width = (_arg_2 * _local_3);
                this._Str_3878.height = _arg_2;
            }
            this._Str_3878.x = Math.round(((k - this._Str_3878.width) * 0.5));
            this._Str_3878.y = Math.round(((_arg_2 - this._Str_3878.height) * 0.5));
        }

        private function _Str_25359():void
        {
            if (this._Str_4245 == null)
            {
                return;
            }
            if (stage.displayState == StageDisplayState.NORMAL)
            {
                this._Str_18354 = this._Str_11185;
                this._Str_11185 = true;
                stage.displayState = StageDisplayState.FULL_SCREEN;
            }
            else
            {
                stage.displayState = StageDisplayState.NORMAL;
            }
        }

        private function _Str_19602():void
        {
            if (this._Str_3404 == _Str_2872.VIDEOSTATEPLAYING)
            {
                this.pause();
            }
            else
            {
                if (((this._Str_3404 == _Str_2872.VIDEOSTATEPAUSED) || (this._Str_3404 == _Str_2872.VIDEOSTATEEMPTY)))
                {
                    this.play();
                }
                else
                {
                    if (this._Str_3404 == _Str_2872.VIDEOSTATESTOPPED)
                    {
                        this.seek(0);
                        this.play();
                    }
                }
            }
        }

        private function _Str_7366(k:Boolean):void
        {
            this._Str_3319.visible = k;
        }

        private function onAddedToStage(k:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            stage.addEventListener(FullScreenEvent.FULL_SCREEN, this._Str_22420, false, 0, true);
        }

        private function _Str_23756(k:VideoControlsEvent):void
        {
            this._Str_3206 = (k.data as Number);
        }

        private function _Str_23822(k:MouseEvent):void
        {
            this._Str_19602();
        }

        private function _Str_22420(k:FullScreenEvent):void
        {
            var _local_2:Stage;
            if (!this._Str_11185)
            {
                return;
            }
            this._Str_3319._Str_25228(stage.displayState);
            if (k.fullScreen)
            {
                this._Str_19047 = stage.align;
                stage.align = StageAlign.TOP_LEFT;
                this._Str_6957 = x;
                this._Str_6961 = y;
                x = 0;
                y = 0;
                _local_2 = stage;
                this._Str_20927 = parent;
                this._Str_19777 = parent.getChildIndex(this);
                parent.removeChild(this);
                _local_2.addChild(this);
                this._Str_5336.width = stage.stageWidth;
                this._Str_5336.height = stage.stageHeight;
                this._Str_16733(stage.stageWidth, stage.stageHeight);
                this._Str_20793 = this._Str_11762;
                this._Str_11762 = true;
                this._Str_3319.x = Math.round(((stage.stageWidth - this._Str_3319.width) * 0.5));
                this._Str_3319.y = Math.round(((stage.stageHeight - this._Str_3319.height) - 100));
                stage.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_4955, false, 0, true);
            }
            else
            {
                this._Str_5336.width = this._Str_4901;
                this._Str_5336.height = this._Str_4960;
                this._Str_16733(this._Str_9635, this._Str_5932);
                stage.align = this._Str_19047;
                x = this._Str_6957;
                y = this._Str_6961;
                stage.removeChild(this);
                this._Str_20927.addChildAt(this, this._Str_19777);
                this._Str_11185 = this._Str_18354;
                this._Str_11762 = this._Str_20793;
                this._Str_3319.x = 0;
                if (this._Str_14540)
                {
                    this._Str_3319.y = (this._Str_5932 - this._Str_3319.height);
                }
                else
                {
                    this._Str_3319.y = this._Str_5932;
                }
                stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_4955);
                this._Str_12093.reset();
                this._Str_7366(true);
            }
        }

        private function _Str_23232(k:VideoControlsEvent):void
        {
            this._Str_25359();
        }

        private function _Str_24752(k:TimerEvent):void
        {
            this._Str_7366(false);
        }

        private function _Str_4955(k:MouseEvent):void
        {
            this._Str_7366(true);
            this._Str_12093.reset();
            this._Str_12093.start();
        }

        public function _Str_25969(k:*):void
        {
        }

        private function onMouseOut(k:MouseEvent):void
        {
            if (this._Str_11808)
            {
                this._Str_7366(false);
            }
        }

        private function onMouseOver(k:MouseEvent):void
        {
            if (this._Str_11808)
            {
                this._Str_7366(true);
            }
        }

        private function _Str_23562(k:VideoControlsEvent):void
        {
            if (k.cancelable)
            {
                k.stopImmediatePropagation();
            }
            this._Str_19602();
        }

        private function _Str_21626(k:VideoControlsEvent):void
        {
            if (k.cancelable)
            {
                k.stopImmediatePropagation();
            }
            this.seek((k.data as Number), (k.type == VideoControlsEvent.SCRUB));
        }

        private function _Str_23806(k:ErrorEvent):void
        {
        }

        private function onError(k:ErrorEvent):void
        {
        }

        private function _Str_22266(k:TimerEvent):void
        {
            if (this._Str_3167 != null)
            {
                this._Str_3319._Str_17296((this._Str_3167.bytesLoaded / this._Str_3167.bytesTotal));
                if (this._Str_3167.bytesLoaded >= this._Str_3167.bytesTotal)
                {
                    this._Str_13484.reset();
                }
            }
        }

        private function _Str_20451(k:NetStatusEvent):void
        {
            switch (k.info["code"])
            {
                case "NetStream.Play.Start":
                    if (this._Str_3404 != _Str_2872.VIDEOSTATEPAUSED)
                    {
                        this._Str_3404 = _Str_2872.VIDEOSTATEPLAYING;
                    }
                    return;
                case "NetStream.Play.Stop":
                    this._Str_3404 = _Str_2872.VIDEOSTATESTOPPED;
                    return;
                case "NetConnection.Connect.Success":
                    this._Str_23773();
                    return;
                case "NetConnection.Connect.Failed":
                    return;
            }
        }

        public function _Str_26358(k:Object):void
        {
            if (this._Str_3404 == _Str_2872.VIDEOSTATESTOPPED)
            {
            }
        }

        private function _Str_23017(k:TimerEvent):void
        {
            if (this._Str_4245 == null)
            {
                return;
            }
            this._Str_3319._Str_12997((this._Str_3167.time / this._Str_4245.duration));
            if (this._Str_3404 == _Str_2872.VIDEOSTATESTOPPED)
            {
                this._Str_8436.reset();
            }
        }

        public function get _Str_4245():VideoMetadataVo
        {
            return this._Str_21382;
        }

        public function set _Str_4245(k:VideoMetadataVo):void
        {
            this._Str_21382 = k;
            if (k != null)
            {
                this._Str_3319.meta = k;
            }
        }

        public function get _Str_3404():String
        {
            return this._Str_8940;
        }

        public function set _Str_3404(k:String):void
        {
            this._Str_8940 = k;
            if (this._Str_3167 != null)
            {
                this._Str_3319.state = k;
            }
            dispatchEvent(new VideoControlsEvent(VideoControlsEvent.STATEUPDATE, true, true, k));
        }

        public function get _Str_3206():Number
        {
            return this._Str_3026;
        }

        public function set _Str_3206(k:Number):void
        {
            this._Str_3026 = k;
            SoundMixer.soundTransform = new SoundTransform(k);
            this._Str_3319._Str_3206 = k;
        }

        public function get _Str_9635():int
        {
            return this._Str_4901;
        }

        public function set _Str_9635(k:int):void
        {
            this._Str_4901 = k;
        }

        public function get _Str_5932():int
        {
            return this._Str_4960;
        }

        public function set _Str_5932(k:int):void
        {
            this._Str_4960 = k;
        }

        public function get _Str_14540():Boolean
        {
            return this._Str_18277;
        }

        public function set _Str_14540(k:Boolean):void
        {
            this._Str_18277 = k;
            if (this._Str_18277)
            {
                this._Str_3319.y = (this._Str_5932 - this._Str_3319.height);
            }
            else
            {
                this._Str_3319.y = this._Str_5932;
            }
        }

        public function get autoPlay():Boolean
        {
            return this._autoPlay;
        }

        public function set autoPlay(k:Boolean):void
        {
            this._autoPlay = k;
        }

        public function get _Str_11762():Boolean
        {
            return this._Str_11808;
        }

        public function set _Str_11762(k:Boolean):void
        {
            this._Str_11808 = k;
            if (this._Str_11808)
            {
                this._Str_7366(false);
            }
            else
            {
                this._Str_7366(true);
            }
        }

        public function get _Str_11185():Boolean
        {
            return this._Str_16161;
        }

        public function set _Str_11185(k:Boolean):void
        {
            this._Str_16161 = k;
        }

        public function get _Str_16581():int
        {
            return this._Str_19802;
        }

        public function set _Str_16581(k:int):void
        {
            this._Str_19802 = k;
        }

        public function get _Str_20925():*
        {
            return this._Str_8247;
        }

        public function set _Str_20925(k:*):void
        {
            var _local_2:URLRequest;
            if (k == null)
            {
                return;
            }
            this._Str_8247 = k;
            if (this._Str_3404 == _Str_2872.VIDEOSTATEEMPTY)
            {
                this._Str_671.visible = true;
                if ((this._Str_8247 is URLRequest))
                {
                    this._Str_671.load(this._Str_8247);
                }
                else
                {
                    if ((this._Str_8247 is String))
                    {
                        _local_2 = new URLRequest(this._Str_8247);
                        this._Str_671.load(_local_2);
                    }
                }
            }
        }

        public function get _Str_17422():_Str_8021
        {
            return this._Str_3319;
        }
    }
}
