package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrack;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.utils._Str_988;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.IWindow;

    public class TalentProgressMeter implements IDisposable 
    {
        private const _Str_22459:String = "talent_achieved_div";
        private const _Str_25810:String = "talent_unachieved_div";
        private const _Str_21230:String = "progress_divider_level_";
        private const _Str_12761:int = 10;

        private var _disposed:Boolean = false;
        private var _habboTalent:HabboTalent;
        private var _controller:TalentTrackController;
        private var _talentTrack:TalentTrack;
        private var _progressContainer:IWindowContainer;
        private var _divider:IStaticBitmapWrapperWindow;
        private var _progressNeedle:IWidgetWindow;
        private var _achievedMid:IStaticBitmapWrapperWindow;
        private var _unachievedMid:IStaticBitmapWrapperWindow;

        public function TalentProgressMeter(k:HabboTalent, _arg_2:TalentTrackController)
        {
            this._habboTalent = k;
            this._controller = _arg_2;
            this._talentTrack = this._controller._Str_19628;
            this._Str_24296();
        }

        public function get width():int
        {
            return this._controller.window.width;
        }

        public function get _Str_19867():int
        {
            return int(Math.floor(_Str_988._Str_1028(this._talentTrack.progressPerLevel, 0, this.width)));
        }

        private function _Str_24296():void
        {
            var _local_2:IStaticBitmapWrapperWindow;
            this._progressContainer = IWindowContainer(this._controller.window.findChildByName("progress_container"));
            this._divider = IStaticBitmapWrapperWindow(this._progressContainer.removeChild(this._progressContainer.findChildByName("progress_level_divider")));
            this._achievedMid = IStaticBitmapWrapperWindow(this._progressContainer.findChildByName("achieved_mid"));
            this._unachievedMid = IStaticBitmapWrapperWindow(this._progressContainer.findChildByName("unachieved_mid"));
            var k:int = 1;
            while (k < this._talentTrack.levels.length)
            {
                _local_2 = IStaticBitmapWrapperWindow(this._divider.clone());
                _local_2.name = (this._Str_21230 + k);
                this._progressContainer.addChild(_local_2);
                k++;
            }
            this._progressNeedle = IWidgetWindow(this._progressContainer.findChildByName("progress_needle"));
            _Str_2483(this._progressNeedle.widget).figure = this._habboTalent._Str_20410.figure;
            this._progressContainer.setChildIndex(this._progressNeedle, (this._progressContainer.numChildren - 1));
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._divider)
                {
                    this._divider.dispose();
                    this._divider = null;
                }
                this._achievedMid = null;
                this._unachievedMid = null;
                this._progressNeedle = null;
                this._progressContainer = null;
                this._talentTrack = null;
                this._controller = null;
                this._habboTalent = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function resize():void
        {
            var _local_5:IStaticBitmapWrapperWindow;
            var k:int = int(Math.floor(_Str_988._Str_1028(this._talentTrack._Str_18600, 0, this.width)));
            this._progressContainer.width = this.width;
            this._unachievedMid.width = this.width;
            this._achievedMid.width = k;
            this._progressNeedle.x = _Str_988._Str_2040((k - int((this._progressNeedle.width / 2))), 0, (this.width - this._progressNeedle.width));
            var _local_2:IWindow = this._progressContainer.findChildByName("avatar_glow");
            _local_2.x = (this._progressNeedle.x - this._Str_12761);
            _local_2.y = (this._progressNeedle.y - this._Str_12761);
            _local_2.width = (this._progressNeedle.width + (2 * this._Str_12761));
            _local_2.height = (this._progressNeedle.height + (2 * this._Str_12761));
            var _local_3:IWindow = this._progressContainer.findChildByName("progress_balloon");
            _local_3.x = (((this._progressNeedle.x + Math.floor((this._progressNeedle.width / 2))) - Math.floor((_local_3.width / 2))) + 5);
            var _local_4:int = 1;
            while (_local_4 < this._talentTrack.levels.length)
            {
                _local_5 = IStaticBitmapWrapperWindow(this._progressContainer.findChildByName((this._Str_21230 + _local_4)));
                _local_5.x = (_local_4 * this._Str_19867);
                if (_local_5.x < k)
                {
                    _local_5.assetUri = this._Str_22459;
                }
                else
                {
                    _local_5.assetUri = this._Str_25810;
                }
                _local_5.visible = true;
                _local_4++;
            }
            this._progressContainer.invalidate();
        }
    }
}
