package com.sulake.habbo.notifications.feed
{
    import com.sulake.habbo.notifications.FeedVisibilityEnum;

    public class StateController 
    {
        private var _isEnabled:Boolean;
        private var _isGameMode:Boolean;
        private var _currentState:int;
        private var _lastRequestedState:int;

        public function StateController()
        {
            this._currentState = FeedVisibilityEnum._Str_7747;
            this._lastRequestedState = FeedVisibilityEnum._Str_6770;
            super();
        }

        private function isActive():Boolean
        {
            return (this._isEnabled) && (!(this._isGameMode));
        }

        public function _Str_6130(k:Boolean):int
        {
            this._isEnabled = k;
            if (!this.isActive())
            {
                return this._Str_18568(FeedVisibilityEnum._Str_7747);
            }
            return this._Str_15221();
        }

        public function _Str_17368(k:Boolean):int
        {
            this._isGameMode = k;
            if (!this.isActive())
            {
                return this._Str_18568(FeedVisibilityEnum._Str_7747);
            }
            return this._Str_15221();
        }

        public function _Str_16276():int
        {
            return this._currentState;
        }

        public function _Str_18568(k:int):int
        {
            if (!this.isActive())
            {
                this._lastRequestedState = k;
                return this._currentState;
            }
            this._currentState = k;
            this._lastRequestedState = k;
            return this._currentState;
        }

        private function _Str_15221():int
        {
            var k:int = this._lastRequestedState;
            if (k == FeedVisibilityEnum._Str_7747)
            {
                k = FeedVisibilityEnum._Str_6770;
            }
            this._currentState = k;
            this._lastRequestedState = k;
            return k;
        }
    }
}
