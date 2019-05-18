package com.sulake.habbo.window.utils.floorplaneditor
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_438._Str_7289;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class ImportExportDialog 
    {
        private var _bcFloorPlanEditor:BCFloorPlanEditor;
        private var _layout:XML;
        private var _window:IFrameWindow = null;

        public function ImportExportDialog(k:BCFloorPlanEditor, _arg_2:XML)
        {
            this._bcFloorPlanEditor = k;
            this._layout = _arg_2;
        }

        public function set visible(k:Boolean):void
        {
            if (this._window == null)
            {
                this._window = IFrameWindow(this._bcFloorPlanEditor.windowManager.buildFromXML(this._layout));
                this._window.center();
                this._window.procedure = this._Str_2533;
            }
            if (k)
            {
                this._window.visible = true;
                this._window.findChildByName("data").caption = this._bcFloorPlanEditor._Str_4134._Str_21406();
                if (((this._bcFloorPlanEditor._Str_22721 > 0) || (this._bcFloorPlanEditor.windowManager.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751))))
                {
                    this._window.findChildByName("save").enable();
                }
                else
                {
                    this._window.findChildByName("save").disable();
                }
                this._window.activate();
            }
            else
            {
                this._window.visible = false;
            }
        }

        public function get visible():Boolean
        {
            if (!this._window)
            {
                return false;
            }
            return this._window.visible;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        this.visible = false;
                        return;
                    case "revert":
                        this._window.findChildByName("data").caption = this._bcFloorPlanEditor._Str_24411;
                        return;
                    case "save":
                        this._bcFloorPlanEditor.windowManager.communication.connection.send(new _Str_7289(this._window.findChildByName("data").caption, this._bcFloorPlanEditor._Str_4134._Str_7642.x, this._bcFloorPlanEditor._Str_4134._Str_7642.y, this._bcFloorPlanEditor._Str_4134._Str_6184, BCFloorPlanEditor._Str_8298(this._bcFloorPlanEditor._Str_5962), BCFloorPlanEditor._Str_8298(this._bcFloorPlanEditor._Str_6205)));
                        return;
                }
            }
        }
    }
}
