//
//  BaseModel.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/12.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class SWBaseModel: NSObject {

    func initWithDataDic(data: NSDictionary) -> AnyObject {
//        super.init()
        setAttributes(dataDic: data)
        return self
    }
    
    /*
    func attributeMapDictionary() -> NSDictionary {
        return nil
    }
     */
    
    func getSetterSelWithAttibuteName(attributeName: String) -> Selector {
//        NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
//        NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[attributeName substringFromIndex:1]];
//        return NSSelectorFromString(setterSelStr);
        
        let index = attributeName.index(attributeName.startIndex, offsetBy: 1)
        let capital = attributeName.substring(to: index).uppercased()
        let setterSelStr = "set" + capital + attributeName.substring(from: index)
        return NSSelectorFromString(setterSelStr)
    }
    
    func setAttributes(dataDic: NSDictionary) {
        var attrMapDic: NSDictionary = NSDictionary()
        if attrMapDic.allKeys.count <= 0 {
            let dic = NSMutableDictionary()
            for key in dataDic.allKeys {
                let value = dataDic["\(key)"]
                dic.setValue(value, forKey: key as! String)
                attrMapDic = dic
            }
        }
        let keyEnum = attrMapDic.keyEnumerator()
//        print(keyEnum.allObjects)
        var attributeName: AnyObject?
        let obj = keyEnum.nextObject()
        if  obj != nil{
            attributeName = obj
        }
        while (attributeName != nil) {
            let sel = self.getSetterSelWithAttibuteName(attributeName: attributeName as! String)
            if self.responds(to: sel) {
                let dataDicKey = attrMapDic.object(forKey: attributeName!)
                let attributeValue = dataDic.object(forKey: dataDicKey!)
                self.performSelector(onMainThread: sel, with: attributeValue, waitUntilDone: Thread.isMainThread)
            }
            let nextObj = keyEnum.nextObject()
            if nextObj == nil{
                break
            }
            attributeName = nextObj
        }
        
        
    }
    
    func initWithCoder(decoder: NSCoder) -> AnyObject {
        let attrMapDic = NSDictionary()
        let keyEnum = attrMapDic.keyEnumerator()
        let attributeName: AnyObject
        attributeName = keyEnum.nextObject()!
        while attributeName.count > 0 {
            let sel = self.getSetterSelWithAttibuteName(attributeName: attributeName as! String)
            if self.responds(to: sel) {
                let obj = decoder.decodeObject(forKey: attributeName as! String)
                self.performSelector(onMainThread: sel, with: obj, waitUntilDone: Thread.isMainThread)
            }
        }
        return self
        
    }
    
    func encodeWithCoder(encoder: NSCoder) {
//        let attrMapDic = NSDictionary()
        
        
    }
    
//    - (void)encodeWithCoder:(NSCoder *)encoder{
//        NSDictionary *attrMapDic = [self attributeMapDictionary];
//        if (attrMapDic == nil) {
//            return;
//        }
//        NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
//        id attributeName;
//        while ((attributeName = [keyEnum nextObject])) {
//            SEL getSel = NSSelectorFromString(attributeName);
//            if ([self respondsToSelector:getSel]) {
//                NSMethodSignature *signature = nil;
//                signature = [self methodSignatureForSelector:getSel];
//                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//                [invocation setTarget:self];
//                [invocation setSelector:getSel];
//                NSObject *valueObj = nil;
//                [invocation invoke];
//                [invocation getReturnValue:&valueObj];
//                
//                if (valueObj) {
//                    [encoder encodeObject:valueObj forKey:attributeName];
//                }
//            }
//        }
//    }
    
    
    /*
    func customDescription() -> String {
        <#function body#>
    }
     */
    
    func swift_description() -> String {
        var attrsDesc: String?
        let attrMapDic = NSDictionary()
        let keyEnum = attrMapDic.keyEnumerator()
        let attributeName: AnyObject?
        attributeName = keyEnum.nextObject()
        while attributeName?.count > 0{
            let getSel = NSSelectorFromString("\(attributeName)")
            
            if self.responds(to: getSel) {
//                let signature: NSMethodSignature?   // 用Swift写BaseModel
                
            }
        }
        return attrsDesc!
        
        /*
        NSMutableString *attrsDesc = [NSMutableString stringWithCapacity:100];
        NSDictionary *attrMapDic = [self attributeMapDictionary];
        NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
        id attributeName;
        
        while ((attributeName = [keyEnum nextObject])) {
            SEL getSel = NSSelectorFromString(attributeName);
            if ([self respondsToSelector:getSel]) {
                NSMethodSignature *signature = nil;
                signature = [self methodSignatureForSelector:getSel];
                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
                [invocation setTarget:self];
                [invocation setSelector:getSel];
                NSObject *valueObj = nil;
                [invocation invoke];
                [invocation getReturnValue:&valueObj];
                //            ITTDINFO(@"attributeName %@ value %@", attributeName, valueObj);
                if (valueObj) {
                    [attrsDesc appendFormat:@" [%@=%@] ",attributeName, valueObj];
                    //[valueObj release];
                }else {
                    [attrsDesc appendFormat:@" [%@=nil] ",attributeName];
                }
                
            }
        }
        
        NSString *customDesc = [self customDescription];
        NSString *desc;
        
        if (customDesc && [customDesc length] > 0 ) {
            desc = [NSString stringWithFormat:@"%@:{%@,%@}",[self class],attrsDesc,customDesc];
        }else {
            desc = [NSString stringWithFormat:@"%@:{%@}",[self class],attrsDesc];
        }
        
        return desc;
     */
        
    }
    
    
    
    func getArchivedData() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }
    
    func cleanString(str: String) -> String {
        var cleanString: NSString
        let strRange: Range = str.startIndex..<str.endIndex
        cleanString = str.replacingOccurrences(of: "\n", with: "", options: String.CompareOptions.caseInsensitive, range: strRange)
        
        cleanString = str.replacingOccurrences(of: "\r", with: "", options: String.CompareOptions.caseInsensitive, range: strRange) // range: NSMakeRange(0, str.characters.count)
        
        return cleanString as String
     
    }
}
