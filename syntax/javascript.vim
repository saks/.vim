syn keyword javaScriptSpecialProperties   prototype constructor
syn keyword javaScriptBuiltInFunctions    parseInt parseFloat isNaN isFinite encodeURIComponent decodeURIComponent encodeURI decodeURI eval setTimeout clearTimeout
syn keyword javaScriptBuiltInMethods      push pop shift unshift concat join split call apply bind indexOf map forEach every filter some reduce isArray keys toLowerCase toUpperCase toLocaleLowerCase toLocaleUpperCase replace substring split slice search match localeCompare lastIndexOf indexOf concat charCodeAt charAt splice sort

syn keyword javaScriptVoid                void
syn keyword javaScriptType                Date Math


" highlight used javascript reserved words as error
hi link javaScriptReserved Error


" mernik.js specific highlighting groups
"
syn keyword javaScriptMernikJS_proto                $proto $class
syn keyword javaScriptMernikJS_special_methods      init_ initContent_ startObservers_ notify startWith endWith subscribe unsubscribe pluralize singularize ordinalize constantize capitalize get set classEval include defineError defineIndex field attrAccessible isAttrAccessible belongsTo hasMany actsAsSynchronizable where
syn keyword javaScriptMernikJS_core_classes         Class Subscribable ContentWidgets
syn keyword javaScriptMernikJS_core_objects         BUS mernikNamespace globalNamespace ORM Storage SettingsStorage Utils
syn keyword javaScriptMernikJS_builtint_functions   inherits extend parseInt10 parseInt10FromStripped trimSpaces strip typeOf emptyFunction returnsTrueFunction returnsFalseFunction isDef isDefAndNotNull isObject isNull isFunction isNumber isString copyArray copyObject deepCopy asyncEach objectSize f log

" mernik.js core extensions
syn keyword javaScriptMernikJS_builtint_functions   include first last delete_ toS toInt toL yDay wDay dayFromZ weekFromZ monthFromZ beginningOfMonth beginningOfWeek endOfMonth endOfWeek daysInMonth fromInt fromS daysAgo days weeks

