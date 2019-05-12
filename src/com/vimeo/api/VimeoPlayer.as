package com.vimeo.api
{
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.system.Security;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.geom.Point;

    public class VimeoPlayer extends Sprite 
    {
        private var container:Sprite;
        private var _Str_3552:Object = false;
        private var _Str_9384:Sprite;
        private var _Str_16225:int = 400;
        private var _Str_17880:int = 300;
        private var _Str_21432:int = 2;
        private var _Str_11297:Timer;

        public function VimeoPlayer(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String="10", _arg_6:int=2)
        {
            this.container = new Sprite();
            this._Str_9384 = new Sprite();
            this._Str_11297 = new Timer(200);
            super();
            this._Str_19791(_arg_3, _arg_4);
            Security.allowDomain("vimeo.com");
            Security.allowDomain("api.vimeo.com");
            var _local_7:String = "&js_api=1";
            this._Str_21432 = _arg_6;
            if (_arg_5 != "9")
            {
                switch (_arg_6)
                {
                    case 2:
                        _local_7 = "&api=1";
                        break;
                }
            }
            else
            {
                this._Str_21432 = 1;
            }
            var _local_8:URLRequest = new URLRequest((((((((((((("http://api.vimeo.com/moogaloop_api.swf?oauth_key=" + k) + "&clip_id=") + _arg_2) + "&width=") + _arg_3) + "&height=") + _arg_4) + "&fullscreen=0&fp_version=") + _arg_5) + _local_7) + "&cache_buster=") + (Math.random() * 1000)));
            var _local_9:LoaderContext = new LoaderContext(true);
            var _local_10:Loader = new Loader();
            _local_10.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onComplete, false, 0, true);
            _local_10.load(_local_8, _local_9);
            this.addEventListener(Event.ADDED_TO_STAGE, this._Str_24616, false, 0, true);
        }

        public function destroy():void
        {
            if (this._Str_3552 == null)
            {
                return;
            }
            if (this._Str_3552["destroy"] != undefined)
            {
                this._Str_3552.destroy();
            }
            if (this.container.contains(DisplayObject(this._Str_3552)))
            {
                this.container.removeChild(DisplayObject(this._Str_3552));
            }
            if (this.contains(this._Str_9384))
            {
                this.removeChild(this._Str_9384);
            }
            if (this.contains(this.container))
            {
                this.removeChild(this.container);
            }
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMove);
        }

        private function _Str_19791(k:int, _arg_2:int):void
        {
            this._Str_16225 = k;
            this._Str_17880 = _arg_2;
        }

        private function onComplete(k:Event):void
        {
            this.container.addChild(k.currentTarget.loader.content);
            this._Str_3552 = k.currentTarget.loader.content;
            this.addChild(this._Str_9384);
            this.container.mask = this._Str_9384;
            this.addChild(this.container);
            this._Str_21200();
            this._Str_11297.addEventListener(TimerEvent.TIMER, this._Str_20624);
            this._Str_11297.start();
        }

        private function _Str_20624(k:TimerEvent):void
        {
            if (this._Str_3552.player_loaded)
            {
                this._Str_11297.stop();
                this._Str_11297.removeEventListener(TimerEvent.TIMER, this._Str_20624);
                this._Str_3552.disableMouseMove();
                if (stage)
                {
                    stage.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMove, false, 0, true);
                }
                dispatchEvent(new Event(Event.COMPLETE));
            }
        }

        private function mouseMove(k:Event):void
        {
            var _local_3:Point;
            var _local_2:MouseEvent = (k as MouseEvent);
            if (_local_2 == null)
            {
                return;
            }
            if (((this._Str_3552) && (this._Str_3552.player_loaded)))
            {
                _local_3 = this.parent.localToGlobal(new Point(this.x, this.y));
                if (((((_local_2.stageX >= _local_3.x) && (_local_2.stageX <= (_local_3.x + this._Str_16225))) && (_local_2.stageY >= _local_3.y)) && (_local_2.stageY <= (_local_3.y + this._Str_17880))))
                {
                    this._Str_3552.mouseMove(_local_2);
                }
                else
                {
                    this._Str_3552.mouseOut();
                }
            }
        }

        private function _Str_21200():void
        {
            var _local_2:* = this._Str_9384.graphics;
            with (_local_2)
            {
                beginFill(0, 1);
                drawRect(container.x, container.y, _Str_16225, _Str_17880);
                endFill();
            }
        }

        public function play():void
        {
            this._Str_3552.play();
        }

        public function pause():void
        {
            this._Str_3552.pause();
        }

        public function _Str_26324():int
        {
            return this._Str_3552.duration;
        }

        public function _Str_26202(k:int):void
        {
            this._Str_3552.seek(k);
        }

        public function _Str_25964(k:String):void
        {
            this._Str_3552.color = uint(("0x" + k));
        }

        public function loadVideo(k:int):void
        {
            this._Str_3552.loadVideo(k);
        }

        public function setSize(k:int, _arg_2:int):void
        {
            this._Str_19791(k, _arg_2);
            this._Str_3552.setSize(k, _arg_2);
            this._Str_21200();
        }

        private function _Str_24616(k:Event):void
        {
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMove);
            this.addEventListener(Event.REMOVED_FROM_STAGE, this._Str_21890, false, 0, true);
        }

        private function _Str_21890(k:Event):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMove);
            this.removeEventListener(Event.REMOVED_FROM_STAGE, this._Str_21890);
        }
    }
}
