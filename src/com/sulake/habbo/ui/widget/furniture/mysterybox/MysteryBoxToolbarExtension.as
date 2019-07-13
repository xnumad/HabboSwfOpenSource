package com.sulake.habbo.ui.widget.furniture.mysterybox
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.events.MysteryBoxKeysUpdateEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IRegionWindow;

    public class MysteryBoxToolbarExtension implements IDisposable 
    {
        private static const MYSTERY_BOX_TOOLBAR_EXTENSION_MINIMISED:String = "mystery_box_toolbar_extension_minimised";
        public static const _Str_4471:Dictionary = new Dictionary();

        private var _disposed:Boolean;
        private var _window:IWindowContainer;
        private var _handler:FurnitureContextMenuWidgetHandler;

        {
            _Str_4471["purple"] = 9452386;
            _Str_4471["blue"] = 3891856;
            _Str_4471["green"] = 6459451;
            _Str_4471["yellow"] = 10658089;
            _Str_4471["lilac"] = 6897548;
            _Str_4471["orange"] = 10841125;
            _Str_4471["turquoise"] = 2661026;
            _Str_4471["red"] = 10104881;
        }

        public function MysteryBoxToolbarExtension(k:FurnitureContextMenuWidgetHandler)
        {
            this._handler = k;
        }

        public function createWindow():void
        {
            var k:XML = (this._handler.widget.assets.getAssetByName("mystery_box_toolbar_extension").content as XML);
            this._window = (this._handler.container.windowManager.buildFromXML(k) as IWindowContainer);
            this._window.findChildByName("faq_link").visible = (!(this._handler.container.config.getProperty("mysterybox.faq.url") == ""));
            this._window.procedure = this._Str_2533;
            this._handler.container.toolbar.extensionView.attachExtension(ToolbarDisplayExtensionIds.MYSTERY_BOX, this._window);
            var _local_2:ISessionDataManager = this._handler.container.sessionDataManager;
            _local_2.events.addEventListener(MysteryBoxKeysUpdateEvent.MBKE_UPDATE, this._Str_19397);
            this._Str_16216(this._Str_18883);
            this._Str_21472(_local_2.mysteryBoxColor, _local_2.mysteryKeyColor);
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (k.target.name)
            {
                case "minimize_region":
                    this._Str_16216(true);
                    return;
                case "maximize_region":
                    this._Str_16216(false);
                    return;
                case "faq_link":
                    HabboWebTools.openWebPage(this._handler.container.config.getProperty("mysterybox.faq.url"), "habboMain");
                    return;
            }
        }

        private function _Str_21472(k:String, _arg_2:String):void
        {
            var _local_5:uint;
            var _local_6:uint;
            if (this._window == null)
            {
                return;
            }
            var _local_3:Boolean = ((!(k == null)) && (!(k == "")));
            this._window.findChildByName("box_colour").visible = _local_3;
            this._window.findChildByName("box_overlay").visible = _local_3;
            this._window.findChildByName("small_box").visible = ((_local_3) && (this._Str_18883));
            IRegionWindow(this._window.findChildByName("box_region"))._Str_2613 = ((_local_3) ? (("${mysterybox.tracker.box." + k.toLowerCase()) + "}") : "");
            if (_local_3)
            {
                _local_5 = _Str_4471[k.toLowerCase()];
                this._window.findChildByName("box_colour").color = _local_5;
                this._window.findChildByName("small_box").color = _local_5;
            }
            var _local_4:Boolean = ((!(_arg_2 == null)) && (!(_arg_2 == "")));
            this._window.findChildByName("key_colour").visible = _local_4;
            this._window.findChildByName("key_overlay").visible = _local_4;
            this._window.findChildByName("small_key").visible = ((_local_4) && (this._Str_18883));
            IRegionWindow(this._window.findChildByName("key_region"))._Str_2613 = ((_local_4) ? (("${mysterybox.tracker.key." + _arg_2.toLowerCase()) + "}") : "");
            if (_local_4)
            {
                _local_6 = _Str_4471[_arg_2.toLowerCase()];
                this._window.findChildByName("key_colour").color = _local_6;
                this._window.findChildByName("small_key").color = _local_6;
            }
        }

        private function _Str_19397(k:MysteryBoxKeysUpdateEvent):void
        {
            this._Str_21472(k.boxColor, k.keyColor);
        }

        private function get _Str_18883():Boolean
        {
            return (!(this._handler == null)) && (this._handler.container.config.getBoolean(MYSTERY_BOX_TOOLBAR_EXTENSION_MINIMISED));
        }

        private function _Str_16216(k:Boolean):void
        {
            if (((!(this._handler == null)) && (!(this._window == null))))
            {
                if (k)
                {
                    this._window.findChildByName("minimize_region").visible = false;
                    this._window.findChildByName("maximize_region").visible = true;
                    this._window.findChildByName("small_box").visible = this._window.findChildByName("box_colour").visible;
                    this._window.findChildByName("small_key").visible = this._window.findChildByName("key_colour").visible;
                    this._window.height = 25;
                }
                else
                {
                    this._window.findChildByName("minimize_region").visible = true;
                    this._window.findChildByName("maximize_region").visible = false;
                    this._window.findChildByName("small_box").visible = false;
                    this._window.findChildByName("small_key").visible = false;
                    this._window.height = 137;
                }
                this._handler.container.config.setProperty(MYSTERY_BOX_TOOLBAR_EXTENSION_MINIMISED, k.toString());
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._handler != null)
            {
                this._handler.container.toolbar.extensionView.detachExtension(ToolbarDisplayExtensionIds.MYSTERY_BOX);
                this._handler.container.sessionDataManager.events.removeEventListener(MysteryBoxKeysUpdateEvent.MBKE_UPDATE, this._Str_19397);
                this._handler = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
