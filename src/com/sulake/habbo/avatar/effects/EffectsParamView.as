package com.sulake.habbo.avatar.effects
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.utils.Timer;
    import com.sulake.habbo.avatar.IHabboAvatarEditorAvatarEffect;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextWindow;

    public class EffectsParamView implements IDisposable 
    {
        private var _model:EffectsModel;
        private var _container:IWindowContainer;
        private var _catalogPageName:String;
        private var _windowManager:IHabboWindowManager;
        private var _secondsCounterTimer:Timer;
        private var _storedSeconds:int = 0;
        private var _storedEffect:IHabboAvatarEditorAvatarEffect = null;

        public function EffectsParamView(k:EffectsModel, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            this._model = k;
            this._windowManager = _arg_2;
            this._container = k.controller.view.effectsParamViewContainer;
            this._catalogPageName = k.controller.manager.getProperty("avatareditor.effects.buy.button.catalog.page.name");
            this._secondsCounterTimer = new Timer(1000);
            this._secondsCounterTimer.addEventListener(TimerEvent.TIMER, this._Str_19275);
            this._container.findChildByName("get_more_button").addEventListener(WindowMouseEvent.CLICK, this._Str_13434);
            this._Str_2491(null);
        }

        public function dispose():void
        {
            if (this._secondsCounterTimer)
            {
                this._secondsCounterTimer.stop();
                this._secondsCounterTimer.removeEventListener(TimerEvent.TIMER, this._Str_19275);
                this._secondsCounterTimer = null;
            }
            this._windowManager = null;
            this._model = null;
        }

        public function get disposed():Boolean
        {
            return this._model == null;
        }

        public function _Str_2491(k:IHabboAvatarEditorAvatarEffect):void
        {
            this._storedEffect = k;
            this._container.visible = true;
            if (k == null)
            {
                this._container.findChildByName("time_left_bg").visible = false;
                this._container.findChildByName("save_to_activate").visible = false;
                this._container.findChildByName("effect_name").visible = false;
            }
            else
            {
                this._container.findChildByName("effect_name").visible = true;
                if (((!(k.isActive)) && (!(k._Str_4010))))
                {
                    this._container.findChildByName("time_left_bg").visible = false;
                    this._container.findChildByName("save_to_activate").visible = true;
                    this._secondsCounterTimer.stop();
                }
                else
                {
                    this._storedSeconds = k._Str_3709;
                    this._Str_10660(k._Str_3709, k.duration, k._Str_4010);
                    this._container.findChildByName("time_left_bg").visible = true;
                    this._container.findChildByName("save_to_activate").visible = false;
                    this._secondsCounterTimer.start();
                }
                this._container.findChildByName("effect_name").caption = ((("$" + "{fx_") + k.type) + "}");
            }
        }

        private function _Str_10660(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            var _local_10:String;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:String;
            var _local_17:String;
            var _local_18:String;
            var _local_4:IWindowContainer = (this._container.findChildByName("time_left_bg") as IWindowContainer);
            var _local_5:IBitmapWrapperWindow = IBitmapWrapperWindow(_local_4.findChildByName("progress_bar_bitmap"));
            var _local_6:BitmapData = new BitmapData(_local_5.width, _local_5.height, false, 0);
            var _local_7:int = ((_arg_3) ? _arg_2 : k);
            var _local_8:Rectangle = new Rectangle(0, 0, int((_local_6.width * (Number(_local_7) / _arg_2))), _local_6.height);
            _local_6.fillRect(_local_8, 2146080);
            _local_5.bitmap = _local_6;
            var _local_9:ITextWindow = ITextWindow(_local_4.findChildByName("effect_time_left"));
            if (_arg_3)
            {
                _local_9.caption = "${avatareditor.effects.active.permanent}";
                _local_10 = _local_9.text;
            }
            else
            {
                if (k > ((60 * 60) * 24))
                {
                    _local_9.caption = "${avatareditor.effects.active.daysleft}";
                    _local_10 = _local_9.text;
                    _local_11 = Math.floor((k / ((60 * 60) * 24)));
                    _local_10 = _local_10.replace("%days_left%", _local_11);
                }
                else
                {
                    _local_9.caption = "${avatareditor.effects.active.timeleft}";
                    _local_10 = _local_9.text;
                    _local_12 = k;
                    _local_13 = Math.floor((_local_12 / (60 * 60)));
                    _local_14 = (Math.floor((_local_12 / 60)) % 60);
                    _local_15 = (_local_12 % 60);
                    _local_16 = ((_local_13 < 10) ? "0" : "");
                    _local_17 = ((_local_14 < 10) ? "0" : "");
                    _local_18 = ((_local_15 < 10) ? "0" : "");
                    if (_local_13 > 0)
                    {
                        _local_10 = _local_10.replace("%time_left%", (((((((_local_16 + _local_13) + ":") + _local_17) + _local_14) + ":") + _local_18) + _local_15));
                    }
                    else
                    {
                        _local_10 = _local_10.replace("%time_left%", ((((_local_17 + _local_14) + ":") + _local_18) + _local_15));
                    }
                }
            }
            _local_9.text = _local_10;
        }

        private function _Str_13434(k:WindowMouseEvent):void
        {
            this._model.controller.manager.catalog.openCatalogPage(this._catalogPageName);
        }

        private function _Str_19275(k:TimerEvent):void
        {
            if (((!(this._storedEffect == null)) && (this._storedEffect.isActive)))
            {
                this._Str_10660(this._storedSeconds--, this._storedEffect.duration, this._storedEffect._Str_4010);
            }
        }
    }
}
