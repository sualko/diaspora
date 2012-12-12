require 'spec_helper'
require 'nokogiri'

describe ScikonHelper do
  before do
    @user = alice
    @person = FactoryGirl.create(:person)
  end
  
  describe "#migrate_publications" do
    before do
      @xml = Nokogiri::XML("<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">   <soapenv:Body>      <ns:getPublicationsByAuthorResponse xmlns:ns=\"http://service.fpkn.unikn.de\">         <ns:return xsi:type=\"ax25:PublicationListTO\" xmlns:ax25=\"http://to.service.fpkn.unikn.de/xsd\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">            <ax25:limit>2</ax25:limit>            <ax25:numberOfResultsInSet>2</ax25:numberOfResultsInSet>            <ax25:offset>0</ax25:offset>            <ax25:publications xsi:type=\"ax25:PublicationTO\">               <ax25:IRLink>http://kops.ub.uni-konstanz.de/handle/urn:nbn:de:bsz:352-200971</ax25:IRLink>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId>pop34027</ax25:externId>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Graf, Sebastian</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId>pop218053</ax25:externId>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Lang, Patrick</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId>pop26107</ax25:externId>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Hohenadel, Stefan</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId>pop91555</ax25:externId>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Waldvogel, Marcel</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:citeSource xsi:nil=\"true\"/>               <ax25:documentType>preprint</ax25:documentType>               <ax25:files xsi:type=\"ax25:PublicationFileTO\">                  <ax25:description xsi:nil=\"true\"/>                  <ax25:displayFilename>Graf_Versatile Key Management.pdf</ax25:displayFilename>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:link>http://kops.ub.uni-konstanz.de/bitstream/handle/urn:nbn:de:bsz:352-200971/Graf_Versatile Key Management.pdf?sequence=3</ax25:link>               </ax25:files>               <ax25:id>urn:nbn:de:bsz:352-200971</ax25:id>               <ax25:institutions xsi:type=\"ax25:InstitutionTO\">                  <ax25:id>12</ax25:id>                  <ax25:name xsi:nil=\"true\"/>                  <ax25:type xsi:nil=\"true\"/>               </ax25:institutions>               <ax25:originalLink>https://sites.google.com/site/discco2012/</ax25:originalLink>               <ax25:projects xsi:nil=\"true\"/>               <ax25:publishedDate>2012-01-01 00:00:00</ax25:publishedDate>               <ax25:summary>Not only does storing data in the cloud utilize specialized infrastructures facilitating immense scalability and high availability, but it also offers a convenient way to share any information with user-defined third-parties. However, storing data on the infrastructure of commercial third party providers, demands trust and confidence. Simple approaches, like merely encrypting the data by providing encryption keys, which at most consist of a shared secret supporting rudimentary data sharing, do not support evolving sets of accessing clients to common data. Based on approaches from the area of stream-encryption, we propose an adaption for enabling scalable and flexible key management within heterogeneous environments like cloud scenarios. Representing access-rights as a graph, we distinguish between the keys used for encrypting hierarchical data and the encrypted updates on the keys enabling flexible join-/leave- operations of clients. This distinction allows us to utilize the high availability of the cloud as updating mechanism without harming confidentiality. Our graph-based key management results in an adaption of nodes related to the changed key. The updates on the keys again continuously create an overhead related to the number of these updated nodes. The proposed scalable approach utilizes cloud-based infrastructures for confidential data and key sharing in collaborative workflows supporting variable client-sets.</ax25:summary>               <ax25:title>Versatile key management for secure cloud storage</ax25:title>               <ax25:updatedDate>2012-08-14 10:41:06</ax25:updatedDate>               <ax25:urn>http://nbn-resolving.de/urn:nbn:de:bsz:352-200971</ax25:urn>            </ax25:publications>            <ax25:publications xsi:type=\"ax25:PublicationTO\">               <ax25:IRLink>http://kops.ub.uni-konstanz.de/handle/urn:nbn:de:bsz:352-192389</ax25:IRLink>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId>pop34027</ax25:externId>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Graf, Sebastian</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId>pop53770</ax25:externId>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Eisele, Joerg</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId>pop91555</ax25:externId>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Waldvogel, Marcel</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:authors xsi:type=\"ax25:PersonTO\">                  <ax25:activities xsi:nil=\"true\"/>                  <ax25:additionalInfo xsi:nil=\"true\"/>                  <ax25:assignments xsi:nil=\"true\"/>                  <ax25:awards xsi:nil=\"true\"/>                  <ax25:city xsi:nil=\"true\"/>                  <ax25:cooperations xsi:nil=\"true\"/>                  <ax25:cv xsi:nil=\"true\"/>                  <ax25:degree xsi:nil=\"true\"/>                  <ax25:doctoralDissertations xsi:nil=\"true\"/>                  <ax25:email xsi:nil=\"true\"/>                  <ax25:externId xsi:nil=\"true\"/>                  <ax25:fax xsi:nil=\"true\"/>                  <ax25:forename xsi:nil=\"true\"/>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:institutions xsi:nil=\"true\"/>                  <ax25:interests xsi:nil=\"true\"/>                  <ax25:lastname>Strittmatter, Marc</ax25:lastname>                  <ax25:lectures xsi:nil=\"true\"/>                  <ax25:pageLayout xsi:nil=\"true\"/>                  <ax25:phone xsi:nil=\"true\"/>                  <ax25:picture xsi:nil=\"true\"/>                  <ax25:previousLectures xsi:nil=\"true\"/>                  <ax25:projects xsi:nil=\"true\"/>                  <ax25:publicationGroups xsi:nil=\"true\"/>                  <ax25:researchIntentions xsi:nil=\"true\"/>                  <ax25:roomId xsi:nil=\"true\"/>                  <ax25:roomNumber xsi:nil=\"true\"/>                  <ax25:secretary xsi:nil=\"true\"/>                  <ax25:sex>M</ax25:sex>                  <ax25:street xsi:nil=\"true\"/>                  <ax25:supervisions xsi:nil=\"true\"/>                  <ax25:systemStatus xsi:nil=\"true\"/>                  <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>                  <ax25:wobsiteURL xsi:nil=\"true\"/>                  <ax25:workshops xsi:nil=\"true\"/>                  <ax25:zip xsi:nil=\"true\"/>               </ax25:authors>               <ax25:citeSource>First publ. in: 5. DFN-Forum Kommunikationstechnologien : Verteilte Systeme im Wissenschaftsbereich ; 21.05.-22.05.2012 in Regensburg ; [Beitraege der Fachtagung] / Paul Mueller... (Hrsg.). - Bonn : Ges. fuer Informatik, 2012. - S. 63-72. - ISBN 978-3-88579-297-0</ax25:citeSource>               <ax25:documentType>conferenceObject</ax25:documentType>               <ax25:files xsi:type=\"ax25:PublicationFileTO\">                  <ax25:description xsi:nil=\"true\"/>                  <ax25:displayFilename>Graf_Cloud Storage_conference.pdf</ax25:displayFilename>                  <ax25:id xsi:nil=\"true\"/>                  <ax25:link>http://kops.ub.uni-konstanz.de/bitstream/handle/urn:nbn:de:bsz:352-192389/Graf_Cloud Storage_conference.pdf?sequence=3</ax25:link>               </ax25:files>               <ax25:id>urn:nbn:de:bsz:352-192389</ax25:id>               <ax25:institutions xsi:type=\"ax25:InstitutionTO\">                  <ax25:id>12</ax25:id>                  <ax25:name xsi:nil=\"true\"/>                  <ax25:type xsi:nil=\"true\"/>               </ax25:institutions>               <ax25:institutions xsi:type=\"ax25:InstitutionTO\">                  <ax25:id>31</ax25:id>                  <ax25:name xsi:nil=\"true\"/>                  <ax25:type xsi:nil=\"true\"/>               </ax25:institutions>               <ax25:originalLink xsi:nil=\"true\"/>               <ax25:projects xsi:nil=\"true\"/>               <ax25:publishedDate>2012-01-01 00:00:00</ax25:publishedDate>               <ax25:summary>Public cloud infrastructures represent alluring storage platforms supporting easy and flexible, location-independent access to the hosted information without any hassle for maintaining own infrastructures.
Already widely established and utilized by end-users as well as by institutions, the hosting of data on untrusted platforms, containing private and confidential information, generates concerns about the security. Technical measures establishing security rely thereby on the technical applicability. As a consequence, legal regulations must be applied to cover those measures even beyond this technical applicability.
This paper provides an evaluation of technical measures combined with legal aspects representing a guideline for secure cloud storage for end-users as well as for institutions. Based upon current approaches providing secure data storage on a technical level, german laws are applied and discussed to give an overview about correct treatment of even confidential data stored securely in the cloud.
As a result, a set of technical possibilities applied on fixed defined security requirements is presented and discussed. These technical measures are extended by legal aspects which must be provided from the site of the hosting Cloud Service Provider.
The presented combination of the technical and the legal perspective on secure cloud storage enables end-users as well as hosting institutions to store their data securely in the cloud in an accountable and transparent way.</ax25:summary>               <ax25:title>A legal and technical perspective on secure cloud storage</ax25:title>               <ax25:updatedDate>2012-08-14 09:02:07</ax25:updatedDate>               <ax25:urn>http://nbn-resolving.de/urn:nbn:de:bsz:352-192389</ax25:urn>            </ax25:publications>            <ax25:totalNumberOfResults>15</ax25:totalNumberOfResults>         </ns:return>      </ns:getPublicationsByAuthorResponse>   </soapenv:Body></soapenv:Envelope>")
      
      @publications = @xml.xpath("//ax25:publications", 'ax25' => AppConfig.services.scikon.ns_ax25)
    end
    
    it 'it gives back the scikon profile' do
      migrate_publications(@publications).nil?.should_not be_true
    end
  end
  
end
