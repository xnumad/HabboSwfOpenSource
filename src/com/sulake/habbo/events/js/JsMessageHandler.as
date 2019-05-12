package com.sulake.habbo.events.js
{
    import com.sulake.habbo.game.HabboGameManager;
    import flash.external.ExternalInterface;

    public class JsMessageHandler 
    {
        private static const _Str_16027:String = ";";
        private static const _Str_13589:String = String.fromCharCode(31);

        private var _manager:HabboGameManager;
        private var _isDisposed:Boolean;
        private var _marshallExceptions:Boolean;

        public function JsMessageHandler(k:HabboGameManager, _arg_2:Boolean=false)
        {
            this._manager = k;
            this._marshallExceptions = _arg_2;
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(JsEventToHabboEnum.HABBOGAMEJSAPIEVENTTOHABBO, this._Str_23909);
            }
        }

        public function dispose():void
        {
            this._manager = null;
            this._isDisposed = true;
        }

        private function _Str_23909(k:String=null):void
        {
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            var _local_10:Array;
            if (this._isDisposed)
            {
                return;
            }
            var _local_2:Boolean = ExternalInterface.marshallExceptions;
            ExternalInterface.marshallExceptions = this._marshallExceptions;
            var _local_3:int = k.indexOf(_Str_16027);
            var _local_4:int = k.indexOf(_Str_13589);
            var _local_5:String = k.substr(0, (_local_3 + 1));
            if (_local_4 != -1)
            {
                _local_6 = k.substr((_local_3 + 1), ((_local_4 - _local_3) - 1));
            }
            else
            {
                _local_6 = k.substr((_local_3 + 1));
            }
            switch (_local_6)
            {
                case JsEventToHabboEnum.QUIT_GAME_EVENT:
                    this._manager._Str_20515();
                    break;
                case JsEventToHabboEnum.HABBOGAMEAPI_GAME_LOADED:
                    this._manager._Str_22015();
                    break;
                case JsEventToHabboEnum.HABBOGAMEAPI_GAME_CRASHED:
                    _local_9 = null;
                    _local_10 = k.split(_Str_13589);
                    if (_local_10.length >= 3)
                    {
                        _local_7 = _local_10[1];
                        _local_8 = _local_10[2];
                        if (_local_10.length >= 4)
                        {
                            _local_9 = _local_10[3];
                        }
                        this._manager._Str_21246(_local_7, _local_8, _local_9);
                    }
                    else
                    {
                        Logger.log(("Invalid game API event: " + k));
                    }
                    break;
            }
            ExternalInterface.marshallExceptions = _local_2;
        }

        public function sendGameEvent(event:String):void
        {
            var preValue:Boolean;
            try
            {
                if (ExternalInterface.available)
                {
                    preValue = ExternalInterface.marshallExceptions;
                    ExternalInterface.marshallExceptions = this._marshallExceptions;
                    ExternalInterface.call(JsEventToGameEnum.FLASHEXTERNALGAMEINTERFACE_SENDGAMEEVENT, event);
                    ExternalInterface.marshallExceptions = preValue;
                }
            }
            catch(e:Error)
            {
                Logger.log(("Failed to send event to game: " + e));
            }
        }
    }
}
