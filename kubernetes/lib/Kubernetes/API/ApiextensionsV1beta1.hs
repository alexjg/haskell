{-
   Kubernetes

   No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

   OpenAPI spec version: 2.0
   Kubernetes API version: v1.9.2
   Generated by Swagger Codegen (https://github.com/swagger-api/swagger-codegen.git)
-}

{-|
Module : Kubernetes.API.ApiextensionsV1beta1
-}

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module Kubernetes.API.ApiextensionsV1beta1 where

import Kubernetes.Core
import Kubernetes.MimeTypes
import Kubernetes.Model as M

import qualified Data.Aeson as A
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.Data as P (Typeable, TypeRep, typeOf, typeRep)
import qualified Data.Foldable as P
import qualified Data.Map as Map
import qualified Data.Maybe as P
import qualified Data.Proxy as P (Proxy(..))
import qualified Data.Set as Set
import qualified Data.String as P
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL
import qualified Data.Time as TI
import qualified Network.HTTP.Client.MultipartFormData as NH
import qualified Network.HTTP.Media as ME
import qualified Network.HTTP.Types as NH
import qualified Web.FormUrlEncoded as WH
import qualified Web.HttpApiData as WH

import Data.Text (Text)
import GHC.Base ((<|>))

import Prelude ((==),(/=),($), (.),(<$>),(<*>),(>>=),Maybe(..),Bool(..),Char,Double,FilePath,Float,Int,Integer,String,fmap,undefined,mempty,maybe,pure,Monad,Applicative,Functor)
import qualified Prelude as P

-- * Operations


-- ** ApiextensionsV1beta1

-- *** createCustomResourceDefinition

-- | @POST \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions@
-- 
-- create a CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
createCustomResourceDefinition 
  :: (Consumes CreateCustomResourceDefinition contentType, MimeRender contentType V1beta1CustomResourceDefinition)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1beta1CustomResourceDefinition -- ^ "body"
  -> KubernetesRequest CreateCustomResourceDefinition contentType V1beta1CustomResourceDefinition accept
createCustomResourceDefinition _  _ body =
  _mkRequest "POST" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data CreateCustomResourceDefinition 
instance HasBodyParam CreateCustomResourceDefinition V1beta1CustomResourceDefinition 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam CreateCustomResourceDefinition Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes CreateCustomResourceDefinition mtype

-- | @application/json@
instance Produces CreateCustomResourceDefinition MimeJSON
-- | @application/yaml@
instance Produces CreateCustomResourceDefinition MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces CreateCustomResourceDefinition MimeVndKubernetesProtobuf


-- *** deleteCollectionCustomResourceDefinition

-- | @DELETE \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions@
-- 
-- delete collection of CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteCollectionCustomResourceDefinition 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest DeleteCollectionCustomResourceDefinition MimeNoContent V1Status accept
deleteCollectionCustomResourceDefinition  _ =
  _mkRequest "DELETE" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data DeleteCollectionCustomResourceDefinition  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam DeleteCollectionCustomResourceDefinition Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes DeleteCollectionCustomResourceDefinition mtype

-- | @application/json@
instance Produces DeleteCollectionCustomResourceDefinition MimeJSON
-- | @application/yaml@
instance Produces DeleteCollectionCustomResourceDefinition MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteCollectionCustomResourceDefinition MimeVndKubernetesProtobuf


-- *** deleteCustomResourceDefinition

-- | @DELETE \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions\/{name}@
-- 
-- delete a CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteCustomResourceDefinition 
  :: (Consumes DeleteCustomResourceDefinition contentType, MimeRender contentType V1DeleteOptions)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the CustomResourceDefinition
  -> V1DeleteOptions -- ^ "body"
  -> KubernetesRequest DeleteCustomResourceDefinition contentType V1Status accept
deleteCustomResourceDefinition _  _ (Name name) body =
  _mkRequest "DELETE" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data DeleteCustomResourceDefinition 
instance HasBodyParam DeleteCustomResourceDefinition V1DeleteOptions 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteCustomResourceDefinition Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "gracePeriodSeconds" - The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
instance HasOptionalParam DeleteCustomResourceDefinition GracePeriodSeconds where
  applyOptionalParam req (GracePeriodSeconds xs) =
    req `setQuery` toQuery ("gracePeriodSeconds", Just xs)

-- | /Optional Param/ "orphanDependents" - Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the \"orphan\" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
instance HasOptionalParam DeleteCustomResourceDefinition OrphanDependents where
  applyOptionalParam req (OrphanDependents xs) =
    req `setQuery` toQuery ("orphanDependents", Just xs)

-- | /Optional Param/ "propagationPolicy" - Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
instance HasOptionalParam DeleteCustomResourceDefinition PropagationPolicy where
  applyOptionalParam req (PropagationPolicy xs) =
    req `setQuery` toQuery ("propagationPolicy", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes DeleteCustomResourceDefinition mtype

-- | @application/json@
instance Produces DeleteCustomResourceDefinition MimeJSON
-- | @application/yaml@
instance Produces DeleteCustomResourceDefinition MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteCustomResourceDefinition MimeVndKubernetesProtobuf


-- *** getAPIResources

-- | @GET \/apis\/apiextensions.k8s.io\/v1beta1\/@
-- 
-- get available resources
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
getAPIResources 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest GetAPIResources MimeNoContent V1APIResourceList accept
getAPIResources  _ =
  _mkRequest "GET" ["/apis/apiextensions.k8s.io/v1beta1/"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data GetAPIResources  

-- | @application/json@
instance Consumes GetAPIResources MimeJSON
-- | @application/yaml@
instance Consumes GetAPIResources MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Consumes GetAPIResources MimeVndKubernetesProtobuf

-- | @application/json@
instance Produces GetAPIResources MimeJSON
-- | @application/yaml@
instance Produces GetAPIResources MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces GetAPIResources MimeVndKubernetesProtobuf


-- *** listCustomResourceDefinition

-- | @GET \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions@
-- 
-- list or watch objects of kind CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listCustomResourceDefinition 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest ListCustomResourceDefinition MimeNoContent V1beta1CustomResourceDefinitionList accept
listCustomResourceDefinition  _ =
  _mkRequest "GET" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListCustomResourceDefinition  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListCustomResourceDefinition Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListCustomResourceDefinition Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListCustomResourceDefinition FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam ListCustomResourceDefinition IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListCustomResourceDefinition LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListCustomResourceDefinition Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListCustomResourceDefinition ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam ListCustomResourceDefinition TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListCustomResourceDefinition Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ListCustomResourceDefinition mtype

-- | @application/json@
instance Produces ListCustomResourceDefinition MimeJSON
-- | @application/yaml@
instance Produces ListCustomResourceDefinition MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListCustomResourceDefinition MimeVndKubernetesProtobuf
-- | @application/json;stream=watch@
instance Produces ListCustomResourceDefinition MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListCustomResourceDefinition MimeVndKubernetesProtobufstreamwatch


-- *** patchCustomResourceDefinition

-- | @PATCH \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions\/{name}@
-- 
-- partially update the specified CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
patchCustomResourceDefinition 
  :: (Consumes PatchCustomResourceDefinition contentType, MimeRender contentType A.Value)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the CustomResourceDefinition
  -> A.Value -- ^ "body"
  -> KubernetesRequest PatchCustomResourceDefinition contentType V1beta1CustomResourceDefinition accept
patchCustomResourceDefinition _  _ (Name name) body =
  _mkRequest "PATCH" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data PatchCustomResourceDefinition 
instance HasBodyParam PatchCustomResourceDefinition A.Value 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam PatchCustomResourceDefinition Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @application/json-patch+json@
instance Consumes PatchCustomResourceDefinition MimeJsonPatchjson
-- | @application/merge-patch+json@
instance Consumes PatchCustomResourceDefinition MimeMergePatchjson
-- | @application/strategic-merge-patch+json@
instance Consumes PatchCustomResourceDefinition MimeStrategicMergePatchjson

-- | @application/json@
instance Produces PatchCustomResourceDefinition MimeJSON
-- | @application/yaml@
instance Produces PatchCustomResourceDefinition MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces PatchCustomResourceDefinition MimeVndKubernetesProtobuf


-- *** readCustomResourceDefinition

-- | @GET \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions\/{name}@
-- 
-- read the specified CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
readCustomResourceDefinition 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the CustomResourceDefinition
  -> KubernetesRequest ReadCustomResourceDefinition MimeNoContent V1beta1CustomResourceDefinition accept
readCustomResourceDefinition  _ (Name name) =
  _mkRequest "GET" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ReadCustomResourceDefinition  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReadCustomResourceDefinition Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "exact" - Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
instance HasOptionalParam ReadCustomResourceDefinition Exact where
  applyOptionalParam req (Exact xs) =
    req `setQuery` toQuery ("exact", Just xs)

-- | /Optional Param/ "export" - Should this value be exported.  Export strips fields that a user can not specify.
instance HasOptionalParam ReadCustomResourceDefinition Export where
  applyOptionalParam req (Export xs) =
    req `setQuery` toQuery ("export", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ReadCustomResourceDefinition mtype

-- | @application/json@
instance Produces ReadCustomResourceDefinition MimeJSON
-- | @application/yaml@
instance Produces ReadCustomResourceDefinition MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReadCustomResourceDefinition MimeVndKubernetesProtobuf


-- *** replaceCustomResourceDefinition

-- | @PUT \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions\/{name}@
-- 
-- replace the specified CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
replaceCustomResourceDefinition 
  :: (Consumes ReplaceCustomResourceDefinition contentType, MimeRender contentType V1beta1CustomResourceDefinition)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the CustomResourceDefinition
  -> V1beta1CustomResourceDefinition -- ^ "body"
  -> KubernetesRequest ReplaceCustomResourceDefinition contentType V1beta1CustomResourceDefinition accept
replaceCustomResourceDefinition _  _ (Name name) body =
  _mkRequest "PUT" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data ReplaceCustomResourceDefinition 
instance HasBodyParam ReplaceCustomResourceDefinition V1beta1CustomResourceDefinition 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReplaceCustomResourceDefinition Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ReplaceCustomResourceDefinition mtype

-- | @application/json@
instance Produces ReplaceCustomResourceDefinition MimeJSON
-- | @application/yaml@
instance Produces ReplaceCustomResourceDefinition MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReplaceCustomResourceDefinition MimeVndKubernetesProtobuf


-- *** replaceCustomResourceDefinitionStatus

-- | @PUT \/apis\/apiextensions.k8s.io\/v1beta1\/customresourcedefinitions\/{name}\/status@
-- 
-- replace status of the specified CustomResourceDefinition
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
replaceCustomResourceDefinitionStatus 
  :: (Consumes ReplaceCustomResourceDefinitionStatus contentType, MimeRender contentType V1beta1CustomResourceDefinition)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the CustomResourceDefinition
  -> V1beta1CustomResourceDefinition -- ^ "body"
  -> KubernetesRequest ReplaceCustomResourceDefinitionStatus contentType V1beta1CustomResourceDefinition accept
replaceCustomResourceDefinitionStatus _  _ (Name name) body =
  _mkRequest "PUT" ["/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/",toPath name,"/status"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data ReplaceCustomResourceDefinitionStatus 
instance HasBodyParam ReplaceCustomResourceDefinitionStatus V1beta1CustomResourceDefinition 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReplaceCustomResourceDefinitionStatus Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ReplaceCustomResourceDefinitionStatus mtype

-- | @application/json@
instance Produces ReplaceCustomResourceDefinitionStatus MimeJSON
-- | @application/yaml@
instance Produces ReplaceCustomResourceDefinitionStatus MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReplaceCustomResourceDefinitionStatus MimeVndKubernetesProtobuf

