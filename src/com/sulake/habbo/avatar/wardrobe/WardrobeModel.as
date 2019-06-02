package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.common.ISideContentModel;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.avatar._Str_5988;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.session.HabboClubLevelEnum;

    public class WardrobeModel implements ISideContentModel 
    {
        private var _controller:HabboAvatarEditor;
        private var _view:WardrobeView;
        private var _slots:Map;
        private var _isInitialized:Boolean = false;

        public function WardrobeModel(k:HabboAvatarEditor)
        {
            this._controller = k;
        }

        public function dispose():void
        {
            var k:_Str_4142;
            this._controller = null;
            for each (k in this._slots)
            {
                k.dispose();
                k = null;
            }
            this._slots = null;
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this._isInitialized = false;
        }

        public function reset():void
        {
            this._isInitialized = false;
        }

        private function init():void
        {
            var _local_2:_Str_4142;
            if (this._view)
            {
                this._view.dispose();
            }
            this._view = new WardrobeView(this);
            if (this._controller.handler != null)
            {
                this._controller.handler._Str_22376();
            }
            if (this._slots)
            {
                for each (_local_2 in this._slots)
                {
                    _local_2.dispose();
                    _local_2 = null;
                }
            }
            this._slots = new Map();
            var k:int = 1;
            while (k <= 10)
            {
                this._slots.add(k, new _Str_4142(this._view._Str_23743, this._controller, k, this._Str_21478(k)));
                k++;
            }
            this._isInitialized = true;
            this._Str_2491();
        }

        public function get controller():HabboAvatarEditor
        {
            return this._controller;
        }

        public function getWindowContainer():IWindowContainer
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            return this._view.getWindowContainer();
        }

        private function _Str_2491():void
        {
            this._view.update();
        }

        public function _Str_15301(k:int, _arg_2:Array):void
        {
            var _local_3:_Str_4142;
            var _local_4:_Str_5988;
            if (!this._isInitialized)
            {
                return;
            }
            if (!_arg_2)
            {
                ErrorReportStorage.addDebugData("WardrobeModel", "updateSlots: outfits is null!");
            }
            if (!this._slots)
            {
                ErrorReportStorage.addDebugData("WardrobeModel", "updateSlots: _slots is null!");
            }
            for each (_local_4 in _arg_2)
            {
                _local_3 = (this._slots.getValue(_local_4.slotId) as _Str_4142);
                if (_local_3)
                {
                    _local_3.update(_local_4.figureString, _local_4.gender, this._Str_21478(_local_3.id));
                }
            }
        }

        private function _Str_21478(k:int):Boolean
        {
            if (k <= 5)
            {
                return this._controller.manager._Str_2627.clubLevel >= HabboClubLevelEnum._Str_2964;
            }
            return this._controller.manager._Str_2627.clubLevel >= HabboClubLevelEnum._Str_2575;
        }

        public function get _Str_22986():Array
        {
            return this._slots.getValues();
        }
    }
}
