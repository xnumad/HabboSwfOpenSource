package com.sulake.habbo.game
{
    import com.sulake.habbo.game.HabboGameManager;
    import flash.events.EventDispatcher;
    import flash.events.Event;
    import flash.display.Stage;
    import com.sulake.core.utils.PlayerVersionCheck;

    public class SharedMessageHandler 
    {
        private var _habboGameManager:HabboGameManager;
        private var _Str_759:EventDispatcher;
        private var _Str_16707:int = -1;
        private var _Str_580:Boolean;

        public function SharedMessageHandler(k:HabboGameManager, _arg_2:EventDispatcher)
        {
            this._habboGameManager = k;
            this._Str_759 = _arg_2;
            this._Str_759.addEventListener(SharedGameEvent.EVENT_TYPE_TO_HABBO, this._Str_19772);
        }

        public function dispose():void
        {
            this._Str_759.removeEventListener(SharedGameEvent.EVENT_TYPE_TO_HABBO, this._Str_19772);
            this._Str_759 = null;
            this._habboGameManager = null;
            this._Str_580 = true;
        }

        public function get _Str_20452():int
        {
            return this._Str_16707;
        }

        public function send(k:int, _arg_2:String, _arg_3:*=null):Boolean
        {
            this._Str_759.dispatchEvent(new SharedGameEvent(SharedGameEvent.EVENT_TYPE_TO_GAME, k, _arg_2, _arg_3));
            return true;
        }

        public function _Str_19772(k:Event):Boolean
        {
            var _local_4:Boolean;
            if (this._Str_580)
            {
                Logger.log(("Shared event received by disposed message handler: " + k));
                return false;
            }
            if (k.type != SharedGameEvent.EVENT_TYPE_TO_HABBO)
            {
                Logger.log("Unknown event received as shared event!");
                return false;
            }
            var _local_2:Object = (k as Object);
            var _local_3:int = _local_2.api;
            switch (_local_3)
            {
                case 1:
                    _local_4 = this._Str_22451(_local_2);
                    break;
                default:
                    Logger.log("Unknown api version for shared event!");
                    _local_4 = false;
            }
            if (((_local_4) && (this._Str_16707 == -1)))
            {
                this._Str_16707 = _local_3;
            }
            return _local_4;
        }

        private function _Str_22451(k:Object):Boolean
        {
            var _local_4:Object;
            var _local_2:String = k.name;
            var _local_3:int = 1;
            switch (_local_2)
            {
                case SharedEventToHabboEnum.STAGE3D_REQUEST:
                    _local_4 = this._Str_23983();
                    if (_local_4)
                    {
                        this.send(_local_3, SharedEventToGameEnum.STAGE3D_RESPONSE, _local_4);
                    }
                    else
                    {
                        this.send(_local_3, SharedEventToGameEnum.STAGE3D_RESPONSE_FAIL, null);
                    }
                    break;
                case SharedEventToHabboEnum.QUIT_GAME_EVENT:
                    this._habboGameManager._Str_20515();
                    break;
                default:
                    Logger.log(((("Unknown shared event name for api v" + _local_3) + ": ") + _local_2));
                    return false;
            }
            return true;
        }

        private function _Str_23983():Object
        {
            var stage:Stage;
            var stage3D:Object;
            var i:int;
            stage = this._habboGameManager.context.displayObjectContainer.stage;
            try
            {
                if (PlayerVersionCheck.majorVersion < 11)
                {
                    Logger.log("Tried to get stage3D with too low player version");
                    return null;
                }
                if (stage.stage3Ds.length > 0)
                {
                    i = 0;
                    while (i < stage.stage3Ds.length)
                    {
                        stage3D = stage.stage3Ds[i];
                        if (stage3D)
                        {
                            return stage3D;
                        }
                        i = (i + 1);
                    }
                    if (!stage3D)
                    {
                        Logger.log("Stage3D request error: no free instances available");
                        return null;
                    }
                }
                else
                {
                    Logger.log("Stage3D request error: zero instances available");
                    return null;
                }
            }
            catch(e:Error)
            {
                Logger.log(("Stage3D request error: " + e));
                return null;
            }
            return null;
        }
    }
}
