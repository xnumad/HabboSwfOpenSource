package com.sulake.core.runtime
{
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.utils.LibraryLoader;
    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.Event;
    import com.sulake.core.runtime.events.WarningEvent;
    import com.sulake.core.runtime.events.ErrorEvent;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import com.sulake.core.Core;
    import flash.utils.ByteArray;
    import flash.system.ApplicationDomain;
    import com.sulake.core.assets.AssetLibrary;
    import flash.utils.getDefinitionByName;
    import com.sulake.core.runtime.exceptions.InvalidComponentException;
    import flash.utils.getQualifiedClassName;
    import com.sulake.core.runtime.events.UnknownEvent;
    import __AS3__.vec.*;

    public class ComponentContext extends Component implements IContext 
    {
        private var _linkEventTrackers:Vector.<ILinkEventTracker>;
        protected var _components:Vector.<Component>;
        protected var _queuees:Vector.<ComponentInterfaceQueue>;
        protected var _loaders:Vector.<LibraryLoader>;
        protected var _debug:Boolean = false;
        protected var _displayObjectContainer:DisplayObjectContainer;
        private var _configurationManager:IHabboConfigurationManager;

        public function ComponentContext(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._displayObjectContainer = new Sprite();
            this._components = new Vector.<Component>();
            this._queuees = new Vector.<ComponentInterfaceQueue>();
            this._linkEventTrackers = new Vector.<ILinkEventTracker>(0);
            super(k, (_arg_2 | Component.COMPONENT_FLAG_CONTEXT), _arg_3);
        }

        public function get root():IContext
        {
            if (((!(context)) || (context == this)))
            {
                return this;
            }
            return context.root;
        }

        public function get displayObjectContainer():DisplayObjectContainer
        {
            return this._displayObjectContainer;
        }

        override public function purge():void
        {
            var k:Component;
            super.purge();
            for each (k in this._components)
            {
                if (k != this)
                {
                    k.purge();
                }
            }
        }

        public function debug(k:String):void
        {
            _lastDebug = k;
            if (((this._debug) && (events)))
            {
                events.dispatchEvent(new Event(Component.COMPONENT_EVENT_DEBUG));
            }
        }

        public function getLastDebugMessage():String
        {
            return _lastDebug;
        }

        public function warning(k:String):void
        {
            _lastWarning = k;
            if (events == null)
            {
            }
            else
            {
                events.dispatchEvent(new WarningEvent(Component.COMPONENT_EVENT_WARNING, k));
            }
        }

        public function getLastWarningMessage():String
        {
            return _lastWarning;
        }

        public function error(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
            _lastError = k;
            if (events == null)
            {
            }
            else
            {
				Habbo.trackLoginStep("Error in ComponentContext" + k);
                events.dispatchEvent(new ErrorEvent(Component.COMPONENT_EVENT_ERROR, k, _arg_2, _arg_3, _arg_4));
            }
        }

        public function getLastErrorMessage():String
        {
            return _lastError;
        }

        final public function loadFromFile(k:URLRequest, _arg_2:LoaderContext):LibraryLoader
        {
            var libraryLoader:LibraryLoader;
            if (this._loaders == null)
            {
                this._loaders = new Vector.<LibraryLoader>();
            }
            for each (libraryLoader in this._loaders)
            {
                if (libraryLoader.url == k.url)
                {
                    return libraryLoader;
                }
            }
            libraryLoader = new LibraryLoader(_arg_2, this._debug);
            libraryLoader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.loadReadyHandler, false);
            libraryLoader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.loadErrorHandler, false);
            libraryLoader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG, this.loadDebugHandler, false);
            libraryLoader.load(k);
            this._loaders.push(libraryLoader);
            return libraryLoader;
        }

        final protected function loadReadyHandler(k:LibraryLoaderEvent):void
        {
            var _local_2:LibraryLoader = (k.target as LibraryLoader);
            this.removeLibraryLoader(_local_2);
            this.prepareComponent(_local_2.resource, Component.COMPONENT_FLAG_NULL, _local_2.domain);
        }

        protected function loadErrorHandler(k:LibraryLoaderEvent):void
        {
            var _local_2:LibraryLoader = (k.target as LibraryLoader);
            var _local_3:String = _local_2.getLastErrorMessage();
            this.removeLibraryLoader(_local_2);
            this.error((((('Failed to download component resource "' + _local_2.url) + '"!') + "\r") + _local_3), true, Core.ERROR_CATEGORY_COMPONENT_RESOURCE_LOAD_ERROR);
        }

        protected function loadDebugHandler(k:LibraryLoaderEvent):void
        {
            var _local_2:LibraryLoader = (k.target as LibraryLoader);
            var _local_3:String = _local_2.getLastDebugMessage();
            this.debug(_local_3);
        }

        protected function removeLibraryLoader(k:LibraryLoader):void
        {
            k.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.loadReadyHandler, false);
            k.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.loadReadyHandler, false);
            k.dispose();
            var _local_2:int = this._loaders.indexOf(k);
            if (_local_2 > -1)
            {
                this._loaders.splice(_local_2, 1);
            }
        }

        public function prepareAssetLibrary(xml:XML, _arg_2:Class):Boolean
        {
            return assets.loadFromResource(xml, _arg_2);
        }

        final public function prepareComponent(resource:Class, flags:uint=0, domain:ApplicationDomain=null):IUnknown
        {
            var manifest:XML;
            var component:Component;
            var componentClass:Class;
            var componentString:String;
            var interfaceList:XMLList;
            var iid:IID;
            var iidList:Array;
            var iidClass:Class;
            var iidString:String;
            var item:XML;
            var version:String;
            var unknown:IUnknown;
            var source:Object;
            var bytes:ByteArray;
            var assetList:XMLList;
            var aliasList:XMLList;
            var assetLibrary:IAssetLibrary;
            var assetManifest:XML;
            var j:uint;
            if (domain == null)
            {
                domain = ApplicationDomain.currentDomain;
            }
            try
            {
                source = (resource as Object).manifest;
                if ((source is XML))
                {
                    manifest = (source as XML);
                }
                else
                {
                    if ((source is Class))
                    {
                        bytes = (new ((source as Class))() as ByteArray);
                        manifest = new XML(bytes.readUTFBytes(bytes.length));
                    }
                }
            }
            catch(e:Error)
            {
				Habbo.trackLoginStep(e.getStackTrace());
                manifest = null;
            }
            if (manifest == null)
            {
                return null;
            }
            var componentList:XMLList = manifest.child("component");
            var i:uint;
            while (i < componentList.length())
            {
                item = componentList[i];
                version = item.attribute("version");
                componentString = item.attribute("class");
                assetList = item.child("assets");
                aliasList = item.child("aliases");
                assetLibrary = null;
                if (assetList.length() > 0)
                {
                    assetManifest = new XML("<manifest><library /></manifest>");
                    assetManifest.library.appendChild(assetList);
                    assetManifest.library.appendChild(aliasList);
                    assetLibrary = new AssetLibrary(("_assets@" + componentString), assetManifest);
                    assetLibrary.loadFromResource(assetManifest, resource);
                }
                componentClass = (domain.getDefinition(componentString) as Class);
                if (componentClass == null)
                {
                    componentClass = (getDefinitionByName(componentString) as Class);
                }
                if (componentClass == null)
                {
                    this.error((("Invalid component class " + componentString) + "!"), true, Core.ERROR_CATEGORY_PREPARE_COMPONENT);
                    return null;
                }
                component = ((assetLibrary == null) ? (new (componentClass)(this, flags)) : new (componentClass)(this, flags, assetLibrary));
                if (component != null)
                {
                    if (assetLibrary != null)
                    {
                        if (component.assets != assetLibrary)
                        {
                            assetLibrary.dispose();
                            this.error((('Component "' + componentString) + '" did not save provided asset library!'), true, Core.ERROR_CATEGORY_PREPARE_COMPONENT);
                        }
                    }
                    interfaceList = item.child("interface");
                    iidList = new Array();
                    j = 0;
                    while (j < interfaceList.length())
                    {
                        iidString = interfaceList[j].attribute("iid");
                        iidClass = (domain.getDefinition(iidString) as Class);
                        if (iidClass == null)
                        {
                            iidClass = (getDefinitionByName(iidString) as Class);
                        }
                        if (iidClass == null)
                        {
                            throw (new InvalidComponentException(("Identifier class defined in manifest not found: " + iidString)));
                        }
                        iid = new (iidClass)();
                        unknown = (component as IUnknown);
                        requiredDependencyIids(component).insert(new InterfaceStruct(iid, component));
                        iidList.push(iid);
                        j++;
                    }
                    this.attachComponent(component, iidList);
                }
                i++;
            }
            return component as IUnknown;
        }

        final public function attachComponent(k:Component, _arg_2:Array):void
        {
            var _local_3:uint;
            var _local_5:IID;
            var _local_6:IID;
            if (this._components == null)
            {
                return;
            }
            if (this._components.indexOf(k) > -1)
            {
                this.error((("Component " + k) + " already attached to context!"), false);
                return;
            }
            this._components.push(k);
            if (k.locked)
            {
                k.events.addEventListener(INTERNAL_EVENT_UNLOCKED, this.unlockEventHandler);
            }
            var _local_4:uint = _arg_2.length;
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_5 = _arg_2[_local_3];
                if (requiredDependencyIids(k).find(_local_5) == null)
                {
                    requiredDependencyIids(k).insert(new InterfaceStruct(_local_5, k));
                }
                requiredDependencyIids(this).insert(new InterfaceStruct(_local_5, k));
                _local_3++;
            }
            if (!k.locked)
            {
                _local_3 = 0;
                while (_local_3 < _local_4)
                {
                    _local_6 = _arg_2[_local_3];
                    if (this.hasQueueForInterface(_local_6))
                    {
                        this.announceInterfaceAvailability(_local_6, k);
                    }
                    _local_3++;
                }
            }
        }

        final public function detachComponent(k:Component):void
        {
            var _local_3:InterfaceStruct;
            var _local_2:InterfaceStructList = requiredDependencyIids(this);
            var _local_4:int = _local_2.getIndexByImplementor(k);
            while (_local_4 > -1)
            {
                _local_3 = _local_2.remove(_local_4);
                _local_4 = _local_2.getIndexByImplementor(k);
            }
            var _local_5:uint;
            while (_local_5 < this._components.length)
            {
                if (this._components[_local_5] == k)
                {
                    this._components.splice(_local_5, 1);
                    k.events.removeEventListener(INTERNAL_EVENT_UNLOCKED, this.unlockEventHandler);
                    return;
                }
                _local_5++;
            }
        }

        override public function queueInterface(k:IID, _arg_2:Function=null):IUnknown
        {
            var _local_5:IUnknown;
            var _local_3:InterfaceStructList = requiredDependencyIids(this);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:InterfaceStruct = _local_3.getStructByInterface(k);
            if (_local_4 != null)
            {
                if (((_local_4.unknown == this) && (_local_4.iis == getQualifiedClassName(k))))
                {
                    return super.queueInterface(k, _arg_2);
                }
                _local_5 = _local_4.unknown.queueInterface(k, _arg_2);
                if (_local_5)
                {
                    return _local_5;
                }
            }
            if (_arg_2 != null)
            {
                this.addQueueeForInterface(k, _arg_2);
                if (((context) && (!(context == this))))
                {
                    context.queueInterface(k, this.announceInterfaceAvailability);
                }
            }
            return null;
        }

        final protected function addQueueeForInterface(k:IID, _arg_2:Function):void
        {
            var _local_3:ComponentInterfaceQueue;
            if (this.hasQueueForInterface(k))
            {
                _local_3 = this.getQueueForInterface(k);
            }
            else
            {
                _local_3 = new ComponentInterfaceQueue(k);
                this._queuees.push(_local_3);
            }
            _local_3.receivers.unshift(_arg_2);
        }

        final protected function hasQueueForInterface(k:IID):Boolean
        {
            if (this._queuees == null)
            {
                return false;
            }
            var _local_2:String = getQualifiedClassName(k);
            var _local_3:uint = this._queuees.length;
            var _local_4:uint;
            while (_local_4 < _local_3)
            {
                if (getQualifiedClassName(this._queuees[_local_4].identifier) == _local_2)
                {
                    return true;
                }
                _local_4++;
            }
            return false;
        }

        final protected function getQueueForInterface(k:IID):ComponentInterfaceQueue
        {
            var _local_3:ComponentInterfaceQueue;
            var _local_2:String = getQualifiedClassName(k);
            var _local_4:uint = this._queuees.length;
            var _local_5:uint;
            while (_local_5 < _local_4)
            {
                _local_3 = this._queuees[_local_5];
                if (getQualifiedClassName(_local_3.identifier) == _local_2)
                {
                    return _local_3;
                }
                _local_5++;
            }
            return null;
        }

        final protected function announceInterfaceAvailability(iid:IID, component:Component):void
        {
            var interfaceQueue:ComponentInterfaceQueue = this.getQueueForInterface(iid);
            if (interfaceQueue == null)
            {
                return;
            }
            var receiversCount:uint = interfaceQueue.receivers.length;
            var counter:uint;
            while (counter < receiversCount)
            {
            	var unknown:IUnknown = component.queueInterface(iid);
                if (unknown == null)
                {
                    this.error((("Interface " + iid) + " still unavailable!"), true, Core.ERROR_CATEGORY_INTERFACE_AVAILABILITY);
                }
                if (interfaceQueue.receivers != null)
                {
                    (interfaceQueue.receivers.pop()(iid, unknown));
                }
                counter++;
            }
        }

        override public function dispose():void
        {
            var count:uint;
            var libraryLoader:LibraryLoader;
            if (!disposed)
            {
                super.dispose();
                if (this._components != null)
                {
                    count = this._components.length;
                    while (count-- > 0)
                    {
                        IUnknown(this._components.pop()).dispose();
                    }
                    this._components = null;
                }
                if (this._queuees != null)
                {
                    count = this._queuees.length;
                    while (count-- > 0)
                    {
                        IDisposable(this._queuees.pop()).dispose();
                    }
                    this._queuees = null;
                }
                if (this._loaders != null)
                {
                    count = this._loaders.length;
                    while (count-- > 0)
                    {
                        libraryLoader = this._loaders[0];
                        this.removeLibraryLoader(libraryLoader);
                        libraryLoader.dispose();
                    }
                    this._loaders = null;
                }
            }
        }

        private function unlockEventHandler(event:UnknownEvent):void
        {
            var interfaceStruct:InterfaceStruct;
            var component:Component = (event.unknown as Component);
            if (!component.disposed)
            {
                component.events.removeEventListener(INTERNAL_EVENT_UNLOCKED, this.unlockEventHandler);
            }
            if (!disposed)
            {
            	var requiredDepdencies:Array = []
				requiredDependencyIids(this).mapStructsByImplementor(component, requiredDepdencies);
                while ((((requiredDepdencies.length) && (!(component.disposed))) && (!(disposed))))
                {
                    interfaceStruct = requiredDepdencies.pop();
                    this.announceInterfaceAvailability(interfaceStruct.iid, component);
                }
                this.root.events.dispatchEvent(new Event(COMPONENT_EVENT_UNLOCKED));
            }
        }

        override public function toXMLString(tabCount:uint=0):String
        {
            var interfaceStruct:InterfaceStruct;
            var line:String = "";
            var count:uint;
            while (count < tabCount)
            {
                line = (line + "\t");
                count++;
            }
            var className:String = getQualifiedClassName(this);
            var xml:String = "";
            xml = (xml + (((line + '<context class="') + className) + '" >\n'));
            var mappedStructs:Array = [];
            var structCount:uint = requiredDependencyIids(this).mapStructsByImplementor(this, mappedStructs);
            var index:uint;
            while (index < structCount)
            {
                interfaceStruct = mappedStructs[index];
                xml = (xml + (((((line + '\t<interface iid="') + interfaceStruct.iis) + '" refs="') + interfaceStruct.references) + '"/>\n'));
                index++;
            }
			for each (var component:Component in this._components)
            {
                if (component != this)
                {
                    xml = (xml + component.toXMLString((tabCount + 1)));
                }
            }
            xml = (xml + (line + "</context>\n"));
            return xml;
        }

        public function set configuration(k:IHabboConfigurationManager):void
        {
            this._configurationManager = k;
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this._configurationManager;
        }

        public function addLinkEventTracker(k:ILinkEventTracker):void
        {
            if (this._linkEventTrackers.indexOf(k) < 0)
            {
                this._linkEventTrackers.push(k);
            }
        }

        public function removeLinkEventTracker(k:ILinkEventTracker):void
        {
            var _local_2:int = this._linkEventTrackers.indexOf(k);
            if (_local_2 > -1)
            {
                this._linkEventTrackers.splice(_local_2, 1);
            }
        }

        public function createLinkEvent(k:String):void
        {
            var _local_2:ILinkEventTracker;
            for each (_local_2 in this._linkEventTrackers)
            {
                if (_local_2.eventUrlPrefix.length > 0)
                {
                    if (k.substr(0, _local_2.eventUrlPrefix.length) == _local_2.eventUrlPrefix)
                    {
                        _local_2.linkReceived(k);
                    }
                }
                else
                {
                    _local_2.linkReceived(k);
                }
            }
        }

        public function get linkEventTrackers():Vector.<ILinkEventTracker>
        {
            return this._linkEventTrackers;
        }
    }
}
