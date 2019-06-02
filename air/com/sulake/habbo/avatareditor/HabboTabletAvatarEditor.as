//com.sulake.habbo.avatareditor.HabboTabletAvatarEditor

package com.sulake.habbo.avatareditor{
    import com.sulake.habbo.communication.IPocketHabboListener;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatareditor.view.MainView;
    import com.sulake.habbo.avatar.structure.IFigureData;
    import com.sulake.habbo.communication.IPocketHabboSession;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import starling.display.DisplayObject;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatareditor.view.Outfit;

    public class HabboTabletAvatarEditor implements IPocketHabboListener {

        private var _avatarRenderManager:IAvatarRenderManager;
        private var _habboUI:HabboUI;
        private var _communication:IHabboCommunicationManager;
        private var _localization:IHabboLocalizationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _mainView:MainView;
        private var _isDisposed:Boolean;
        private var _figureStructureData:IFigureData;
        private var _incomingMessage:IncomingMessages;
        private var _pocketSession:IPocketHabboSession;
        private var _hotLooks:Dictionary;
        private var _wardrobeMode:int;
        private var _effectController:EffectsController;
        private var _showClubItemsDimmed:Boolean;
        private var _figures:Dictionary;
        private var _gender:String;
        private var _figureString:String;
        private var _initialized:Boolean;

        public function HabboTabletAvatarEditor(k:HabboUI, _arg_2:IHabboCommunicationManager, _arg_3:IHabboLocalizationManager, _arg_4:ISessionDataManager);

        private function onPocketHabboSessionCreated(k:Event):void;

        private function onAvatarLibraryReady(k:Event):void;

        public function dispose():void;

        public function isViewLoaded():Boolean;

        public function get view():DisplayObject;

        private function init():void;

        public function send(k:IMessageComposer):void;

        public function get habboUI():HabboUI;

        public function get sessionDataManager():ISessionDataManager;

        public function get localization():IHabboLocalizationManager;

        public function requestViewClosing():void;

        public function getDefaultColour(k:String):int;

        public function getFigureSetType(k:String):ISetType;

        public function getPalette(k:int):IPalette;

        public function get figureData():FigureData;

        public function get avatarRenderManager():IAvatarRenderManager;

        public function show():void;

        public function hide():void;

        public function get communication():IHabboCommunicationManager;

        public function getWardrobe(k:int):void;

        public function showWardrobe(k:int, _arg_2:Vector.<Outfit>):void;

        public function updateView():void;

        public function showHotlooks():void;

        public function showEffects():void;

        public function get disposed():Boolean;

        public function pocketHabboResponse(k:String, _arg_2:Object):void;

        public function pocketHabboRawResponse(k:String, _arg_2:Object):void;

        public function pocketHabboError(k:String, _arg_2:Object):void;

        public function saveWardrobeOutfit(k:int, _arg_2:String, _arg_3:String):void;

        public function get effectController():EffectsController;

        public function get showClubItemsFirst():Boolean;

        public function showClubItemsDimmedConfiguration():Boolean;

        public function hasInvalidClubItems():Boolean;

        public function stripClubItems():void;

        public function loadAvatarInEditor(k:String, _arg_2:String):void;

        public function set gender(k:String):void;

        public function get gender():String;

        public function reset():void;

        public function changeGender(k:String, _arg_2:Boolean=false):void;


    }
}//package com.sulake.habbo.avatareditor

