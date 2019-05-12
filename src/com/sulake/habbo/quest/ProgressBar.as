package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;

    public class ProgressBar implements IDisposable 
    {
        private static const _Str_17552:int = 3;
        private static const _Str_16871:int = 10;

        private var _questEngine:HabboQuestEngine;
        private var _window:IWindowContainer;
        private var _progressBarWidth:int;
        private var _progressKey:String;
        private var _hasFrame:Boolean;
        private var _currentAmount:int;
        private var _maxAmount:int;
        private var _scoreAtStartOfLevel:int;
        private var _parentId:int;
        private var _startProgressWidth:int;
        private var _currentProgressWidth:int;
        private var _update:Boolean;

        public function ProgressBar(k:HabboQuestEngine, _arg_2:IWindowContainer, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Point)
        {
            this._questEngine = k;
            this._window = _arg_2;
            this._progressBarWidth = _arg_3;
            this._progressKey = _arg_4;
            this._hasFrame = _arg_5;
            var _local_7:IWindowContainer = IWindowContainer(this._window.findChildByName("progress_bar_cont"));
            if (_local_7 == null)
            {
                _local_7 = IWindowContainer(this._questEngine.getXmlWindow("ProgressBar"));
                this._window.addChild(_local_7);
                _local_7.x = _arg_6.x;
                _local_7.y = _arg_6.y;
                _local_7.width = (this._progressBarWidth + _Str_16871);
            }
        }

        public function refresh(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_5:Boolean = ((!(_arg_3 == this._parentId)) || (!(_arg_2 == this._maxAmount)));
            this._maxAmount = _arg_2;
            this._currentAmount = k;
            this._startProgressWidth = this._currentProgressWidth;
            this._parentId = _arg_3;
            this._scoreAtStartOfLevel = _arg_4;
            if (((_local_5) || ((this._currentAmount == 0) && (this._currentProgressWidth > 0))))
            {
                this._currentProgressWidth = this._Str_19753(this._currentAmount);
            }
            this._update = true;
            this._Str_2491();
        }

        public function set visible(k:Boolean):void
        {
            var _local_2:IWindowContainer = IWindowContainer(this._window.findChildByName("progress_bar_cont"));
            if (_local_2 != null)
            {
                _local_2.visible = k;
            }
        }

        public function _Str_2491():void
        {
            var _local_11:int;
            if (!this._update)
            {
                return;
            }
            var k:IWindow = this._window.findChildByName("bar_a_bkg");
            var _local_2:IWindow = this._window.findChildByName("bar_a_c");
            var _local_3:IWindow = this._window.findChildByName("bar_a_r");
            var _local_4:IWindow = this._window.findChildByName("bar_l");
            var _local_5:IWindow = this._window.findChildByName("bar_c");
            var _local_6:IWindow = this._window.findChildByName("bar_r");
            _local_4.visible = this._hasFrame;
            _local_5.visible = this._hasFrame;
            _local_6.visible = this._hasFrame;
            if (this._hasFrame)
            {
                _local_5.width = this._progressBarWidth;
                _local_6.x = (this._progressBarWidth + _local_2.x);
            }
            var _local_7:int = this._Str_19753(this._currentAmount);
            if (this._currentProgressWidth < _local_7)
            {
                _local_11 = Math.min(Math.abs((this._currentProgressWidth - _local_7)), Math.abs((this._startProgressWidth - _local_7)));
                this._currentProgressWidth = Math.min(_local_7, (this._currentProgressWidth + Math.max(1, Math.round(Math.sqrt(_local_11)))));
            }
            var _local_8:* = (this._currentProgressWidth > 0);
            k.visible = _local_8;
            _local_2.visible = _local_8;
            _local_3.visible = _local_8;
            if (_local_8)
            {
                _local_2.blend = (1 - ((_local_7 - this._currentProgressWidth) / (_local_7 - this._startProgressWidth)));
                _local_2.width = this._currentProgressWidth;
                _local_3.x = (this._currentProgressWidth + _local_2.x);
                k.width = (_local_3.right - _local_2.left);
            }
            this._update = (this._currentProgressWidth < _local_7);
            var _local_9:IWindow = this._window.findChildByName("progress_txt");
            var _local_10:int = ((this._update) ? Math.round(((this._currentProgressWidth / this._progressBarWidth) * this._maxAmount)) : this._currentAmount);
            this._questEngine.localization.registerParameter(this._progressKey, "progress", ("" + (_local_10 + this._scoreAtStartOfLevel)));
            this._questEngine.localization.registerParameter(this._progressKey, "limit", ("" + (this._maxAmount + this._scoreAtStartOfLevel)));
            _local_9.caption = this._questEngine.localization.getLocalization(this._progressKey, this._progressKey);
            _local_9.x = ((_Str_17552 + _local_2.x) + ((this._progressBarWidth - _local_9.width) / 2));
        }

        public function dispose():void
        {
            this._questEngine = null;
            this._window = null;
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        private function _Str_19753(k:int):int
        {
            return Math.max(0, Math.round(((this._progressBarWidth * k) / this._maxAmount)));
        }
    }
}
