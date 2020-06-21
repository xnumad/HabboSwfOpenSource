package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.ui.IRoomUI;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDCoreWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDCoreLocalizationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import flash.events.Event;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboRoomUI;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.avatar.enum.AvatarEditorEvent;
    import com.sulake.habbo.ui.IRoomDesktop;
    import com.sulake.iid.*;

    public class HabboAvatarEditorManager extends Component implements IHabboAvatarEditor, ILinkEventTracker 
    {
        public static const SETUP_WITHOUT_INVENTORY:uint = 1;
        public static const SETUP_WITHOUT_TOOLBAR:uint = 2;
        public static const SETUP_WITHOUT_COMMUNICATION:uint = 3;
        private static const GENERIC:String = AvatarEditorFigureCategory.GENERIC;//"generic"

        private var _windowManager:IHabboWindowManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _inventory:IHabboInventory;
        private var _localization:IHabboLocalizationManager;
        private var _communication:IHabboCommunicationManager;
        private var _catalog:IHabboCatalog;
        private var _sessionData:ISessionDataManager;
        private var _roomUI:IRoomUI;
        private var _handler:AvatarEditorMessageHandler;
        private var _editors:Map;

        public function HabboAvatarEditorManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._editors = new Map();
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDCoreWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }, ((flags & SETUP_WITHOUT_COMMUNICATION) == 0)), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderManager = k;
            }, true, [{
                "type":AvatarRenderEvent.AVATAR_RENDER_READY,
                "callback":this.onAvatarRendererReady
            }]), new ComponentDependency(new IIDHabboInventory(), function (k:IHabboInventory):void
            {
                _inventory = k;
            }, ((flags & SETUP_WITHOUT_INVENTORY) == 0), []), new ComponentDependency(new IIDCoreLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":Event.COMPLETE,
                "callback":this.onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }, ((flags & SETUP_WITHOUT_TOOLBAR) == 0)), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionData = k;
            }), new ComponentDependency(new IIDHabboRoomUI(), function (k:IRoomUI):void
            {
                _roomUI = k;
            }, false)]));
        }

        private function onConfigurationComplete(k:Event):void
        {
        }

        override protected function initComponent():void
        {
            context.addLinkEventTracker(this);
            if (this._communication)
            {
                this._handler = new AvatarEditorMessageHandler(this, this._communication);
            }
        }

        override public function dispose():void
        {
            var k:HabboAvatarEditor;
            if (this._editors)
            {
                for each (k in this._editors)
                {
                    k.dispose();
                    k = null;
                }
                this._editors = null;
            }
            if (this._handler != null)
            {
                this._handler.dispose();
                this._handler = null;
            }
            super.dispose();
        }

        public function openEditor(k:uint, _arg_2:_Str_5523, _arg_3:Array=null, _arg_4:Boolean=false, _arg_5:String=null, _arg_6:String="generic"):IFrameWindow
        {
            var _local_7:HabboAvatarEditor = this._editors.getValue(k);
            if (!_local_7)
            {
                _local_7 = new HabboAvatarEditor(k, this);
                this._editors.add(k, _local_7);
            }
            return _local_7.openWindow(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        public function embedEditorToContext(k:uint, _arg_2:IWindowContainer, _arg_3:_Str_5523=null, _arg_4:Array=null, _arg_5:Boolean=false, _arg_6:Boolean=false):Boolean
        {
            var _local_7:HabboAvatarEditor = this._editors.getValue(k);
            if (_local_7)
            {
                _local_7.dispose();
            }
            _local_7 = new HabboAvatarEditor(k, this, _arg_6);
            this._editors.add(k, _local_7);
            _local_7.embedToContext(_arg_2, _arg_3, _arg_4, _arg_5);
            return true;
        }

        public function loadAvatarInEditor(k:uint, _arg_2:String, _arg_3:String, _arg_4:int=0):void
        {
            var _local_5:HabboAvatarEditor = (this._editors.getValue(k) as HabboAvatarEditor);
            if (_local_5)
            {
                return _local_5.loadAvatarInEditor(_arg_2, _arg_3, _arg_4);
            }
        }

        public function loadOwnAvatarInEditor(k:uint):void
        {
            var _local_2:HabboAvatarEditor = (this._editors.getValue(k) as HabboAvatarEditor);
            if (_local_2)
            {
                return _local_2.loadAvatarInEditor(this.sessionData.figure, this.sessionData.gender, this.sessionData.clubLevel);
            }
        }

        public function close(k:uint):void
        {
            if (!this._editors)
            {
                return;
            }
            var _local_2:HabboAvatarEditor = (this._editors.getValue(k) as HabboAvatarEditor);
            if (!_local_2)
            {
                return;
            }
            _local_2.figureData.avatarEffectType = this.inventory.getLastActivatedEffect();
            switch (k)
            {
                case AvatarEditorInstanceId.OWN_AVATAR_EDITOR:
                    _local_2.hide();
                    return;
                case AvatarEditorInstanceId.FURNITURE_AVATAR_EDITOR:
                    _local_2.hide();
                    _local_2.dispose();
                    this._editors.remove(k);
                    return;
                case AvatarEditorInstanceId.BOT_EDITOR:
                    return;
                default:
                    _local_2.dispose();
                    this._editors.remove(k);
            }
        }

        public function getEditor(k:uint):HabboAvatarEditor
        {
            return this._editors.getValue(k) as HabboAvatarEditor;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        private function onAvatarRendererReady(k:Event=null):void
        {
            this.events.dispatchEvent(new Event(AvatarEditorEvent.AVATAR_EDITOR_READY));
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function get handler():AvatarEditorMessageHandler
        {
            return this._handler;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get sessionData():ISessionDataManager
        {
            return this._sessionData;
        }

        public function get inventory():IHabboInventory
        {
            return this._inventory;
        }

        public function get roomDesktop():IRoomDesktop
        {
            return this._roomUI.getDesktop("hard_coded_room_id");
        }

        public function get linkPattern():String
        {
            return "avatareditor/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "open":
                    this.openEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR, null, null, true);
                    this.loadOwnAvatarInEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
                    return;
            }
        }
    }
}
