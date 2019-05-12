package com.sulake.habbo.avatar.effects
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.avatar.IHabboAvatarEditorAvatarEffect;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;

    public class AvatarEditorGridItemEffect 
    {
        private var _window:IWindowContainer;
        private var _Str_2779:IWindow;
        private var _Str_2968:Boolean = false;
        private var _Str_18530:IHabboAvatarEditorAvatarEffect;

        public function AvatarEditorGridItemEffect(k:IHabboAvatarEditorAvatarEffect, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            this._window = IWindowContainer(_arg_2.buildFromXML((_arg_3.getAssetByName("avatar_editor_effect_griditem_xml").content as XML)));
            this._Str_2779 = this._window.findChildByTag("BG_COLOR");
            this._Str_18530 = k;
            if (k != null)
            {
                this.bitmap = k.icon;
                this.amount = k._Str_4225;
                if (k._Str_4010)
                {
                    this._Str_10660(k.duration, k.duration);
                }
                else
                {
                    if (k.isActive)
                    {
                        this._Str_10660(k._Str_3709, k.duration);
                    }
                }
            }
            else
            {
                this.bitmap = BitmapData(_arg_2.assets.getAssetByName("avatar_editor_generic_remove_selection").content);
                this.amount = 1;
            }
            this.selected = false;
            this._window.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
            this._window.addEventListener(WindowMouseEvent.OUT, this._Str_17495);
        }

        public function get effectType():int
        {
            return (this._Str_18530 != null) ? this._Str_18530.type : -1;
        }

        private function _Str_17495(k:WindowMouseEvent):void
        {
            if (!this._Str_2968)
            {
                this._Str_2779.visible = false;
            }
            this._Str_2779.blend = 1;
        }

        private function onMouseOver(k:WindowMouseEvent):void
        {
            if (!this._Str_2968)
            {
                this._Str_2779.visible = true;
                this._Str_2779.blend = 0.5;
            }
        }

        public function get window():IWindow
        {
            return this._window;
        }

        public function set selected(k:Boolean):void
        {
            this._Str_2968 = k;
            this._Str_2779.visible = this._Str_2968;
            this._Str_2779.blend = 1;
        }

        private function set bitmap(k:BitmapData):void
        {
            IBitmapWrapperWindow(this._window.findChildByName("bitmap")).bitmap = k;
        }

        private function set amount(k:int):void
        {
            var _local_2:IWindowContainer = IWindowContainer(this._window.findChildByName("effect_amount_bg1"));
            var _local_3:ITextWindow = ITextWindow(this._window.findChildByName("effect_amount"));
            _local_2.visible = (k > 1);
            _local_3.text = k.toString();
        }

        private function _Str_10660(k:int, _arg_2:int):void
        {
            this._window.findChildByName("duration_container").visible = true;
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("progress_bar"));
            var _local_4:BitmapData = new BitmapData(_local_3.width, _local_3.height, false, 0);
            var _local_5:Rectangle = new Rectangle(0, 0, int((_local_4.width * (Number(k) / _arg_2))), _local_4.height);
            _local_4.fillRect(_local_5, 2146080);
            _local_3.bitmap = _local_4;
        }
    }
}
