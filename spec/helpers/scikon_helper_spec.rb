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
      
      @a = Author.new :name => "nothing.hill", 
                      :uid => "pop34027"
                      
      @helper = Object.new.extend ScikonHelper
    end
    
    it 'it gives back the scikon profile' do
      @helper.stub(:get_person_profile).and_return(@a)
      
      (@publications.size == 2).should be_true
      
      sciprofile = @helper.migrate_publications :publications => @publications
      sciprofile.nil?.should_not be_true
      
      sciprofile.publications.nil?.should_not be_true
      
      size_bool = sciprofile.publications.size == 2
      size_bool.should be_true
      
      sciprofile.publications.each do |k, publication|
        publication.publication_title.nil?.should_not be_true
        
        (publication.authors.size > 0).should be_true
        
        publication.authors.each do |k, author|
          author.name.nil?.should be_false
        end
      end
      
      # Checking author migrations now
      
      (sciprofile.authors.size > 0).should be_true
    end
  end
  
  describe '#migrate_person_profile' do
    before do
      @xml = Nokogiri::XML('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
               <soapenv:Body>
                  <ns:getPersonProfileResponse xmlns:ns="http://service.fpkn.unikn.de">
                     <ns:return xsi:type="ax25:PersonTO" xmlns:ax25="http://to.service.fpkn.unikn.de/xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                        <ax25:activities xsi:nil="true"/>
                        <ax25:additionalInfo xsi:nil="true"/>
                        <ax25:assignments xsi:type="ax25:AssignmentTO">
                           <ax25:description xsi:nil="true"/>
                           <ax25:end xsi:nil="true"/>
                           <ax25:id>104</ax25:id>
                           <ax25:role>20</ax25:role>
                           <ax25:start xsi:nil="true"/>
                           <ax25:text>LS Verteilte Systeme</ax25:text>
                        </ax25:assignments>
                        <ax25:awards xsi:nil="true"/>
                        <ax25:city>Konstanz</ax25:city>
                        <ax25:cooperations xsi:nil="true"/>
                        <ax25:cv xsi:nil="true"/>
                        <ax25:degree xsi:nil="true"/>
                        <ax25:doctoralDissertations xsi:type="ax25:DoctoralDissertationTO">
                           <ax25:author xsi:nil="true"/>
                           <ax25:id>999</ax25:id>
                           <ax25:reviewers xsi:type="ax25:PersonTO">
                              <ax25:activities xsi:nil="true"/>
                              <ax25:additionalInfo xsi:nil="true"/>
                              <ax25:assignments xsi:nil="true"/>
                              <ax25:awards xsi:nil="true"/>
                              <ax25:city xsi:nil="true"/>
                              <ax25:cooperations xsi:nil="true"/>
                              <ax25:cv xsi:nil="true"/>
                              <ax25:degree>Prof. Dr.</ax25:degree>
                              <ax25:doctoralDissertations xsi:nil="true"/>
                              <ax25:email xsi:nil="true"/>
                              <ax25:externId>pop91555</ax25:externId>
                              <ax25:fax xsi:nil="true"/>
                              <ax25:forename>Marcel</ax25:forename>
                              <ax25:id>1017</ax25:id>
                              <ax25:institutions xsi:nil="true"/>
                              <ax25:interests xsi:nil="true"/>
                              <ax25:lastname>Waldvogel</ax25:lastname>
                              <ax25:lectures xsi:nil="true"/>
                              <ax25:pageLayout xsi:nil="true"/>
                              <ax25:phone xsi:nil="true"/>
                              <ax25:picture xsi:nil="true"/>
                              <ax25:previousLectures xsi:nil="true"/>
                              <ax25:projects xsi:nil="true"/>
                              <ax25:publicationGroups xsi:nil="true"/>
                              <ax25:researchIntentions xsi:nil="true"/>
                              <ax25:roomId xsi:nil="true"/>
                              <ax25:roomNumber xsi:nil="true"/>
                              <ax25:secretary xsi:nil="true"/>
                              <ax25:sex>M</ax25:sex>
                              <ax25:street xsi:nil="true"/>
                              <ax25:supervisions xsi:nil="true"/>
                              <ax25:systemStatus xsi:nil="true"/>
                              <ax25:totalNumberOfPublications>0</ax25:totalNumberOfPublications>
                              <ax25:wobsiteURL xsi:nil="true"/>
                              <ax25:workshops xsi:nil="true"/>
                              <ax25:zip xsi:nil="true"/>
                           </ax25:reviewers>
                           <ax25:title>Secure Storage in the Cloud</ax25:title>
                        </ax25:doctoralDissertations>
                        <ax25:email>Sebastian.Graf@uni-konstanz.de</ax25:email>
                        <ax25:externId>pop34027</ax25:externId>
                        <ax25:fax>(+49) 07531 88-3739</ax25:fax>
                        <ax25:forename>Sebastian</ax25:forename>
                        <ax25:id>2492</ax25:id>
                        <ax25:institutions xsi:type="ax25:InstitutionTO">
                           <ax25:id>9</ax25:id>
                           <ax25:name>FB Informatik und Informationswissenschaft</ax25:name>
                           <ax25:type>13</ax25:type>
                        </ax25:institutions>
                        <ax25:institutions xsi:type="ax25:InstitutionTO">
                           <ax25:id>104</ax25:id>
                           <ax25:name>LS Verteilte Systeme</ax25:name>
                           <ax25:type>8</ax25:type>
                        </ax25:institutions>
                        <ax25:interests xsi:nil="true"/>
                        <ax25:lastname>Graf</ax25:lastname>
                        <ax25:lectures xsi:type="ax25:LectureTO">
                           <ax25:hyperlink xsi:nil="true"/>
                           <ax25:id>34104</ax25:id>
                           <ax25:infoURL><![CDATA[https://lsf.uni-konstanz.de/qisserver/rds?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&veranstaltung.veranstid=34104]]></ax25:infoURL>
                           <ax25:number>INF-10215-20122</ax25:number>
                           <ax25:title>Bachelor-Projekt Verteilte Systeme</ax25:title>
                           <ax25:type>Projekt</ax25:type>
                        </ax25:lectures>
                        <ax25:lectures xsi:type="ax25:LectureTO">
                           <ax25:hyperlink xsi:nil="true"/>
                           <ax25:id>34105</ax25:id>
                           <ax25:infoURL><![CDATA[https://lsf.uni-konstanz.de/qisserver/rds?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&veranstaltung.veranstid=34105]]></ax25:infoURL>
                           <ax25:number>INF-10275-20122</ax25:number>
                           <ax25:title>Master Project Distributed Systems</ax25:title>
                           <ax25:type>Projekt</ax25:type>
                        </ax25:lectures>
                        <ax25:pageLayout xsi:nil="true"/>
                        <ax25:phone>(+49) 07531 88-4319</ax25:phone>
                        <ax25:picture xsi:type="ax25:PictureTO">
                           <ax25:altText>SebastianGraf</ax25:altText>
                           <ax25:height>0</ax25:height>
                           <ax25:text>SebastianGraf</ax25:text>
                           <ax25:url>https://lsf.uni-konstanz.de:443/qisserver/rds?state=medialoader&amp;objectid=238&amp;application=lsf</ax25:url>
                           <ax25:width>0</ax25:width>
                        </ax25:picture>
                        <ax25:previousLectures xsi:type="ax25:LectureTO">
                           <ax25:hyperlink xsi:nil="true"/>
                           <ax25:id>31700</ax25:id>
                           <ax25:infoURL><![CDATA[https://lsf.uni-konstanz.de/qisserver/rds?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&veranstaltung.veranstid=31700]]></ax25:infoURL>
                           <ax25:number>INF-10215-20121</ax25:number>
                           <ax25:title>Bachelor-Projekt Verteilte Systeme</ax25:title>
                           <ax25:type>Projekt</ax25:type>
                        </ax25:previousLectures>
                        <ax25:previousLectures xsi:type="ax25:LectureTO">
                           <ax25:hyperlink xsi:nil="true"/>
                           <ax25:id>31703</ax25:id>
                           <ax25:infoURL><![CDATA[https://lsf.uni-konstanz.de/qisserver/rds?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&veranstaltung.veranstid=31703]]></ax25:infoURL>
                           <ax25:number>INF-11530-20121</ax25:number>
                           <ax25:title>Design Patterns and Concurrency</ax25:title>
                           <ax25:type>Vorlesung/Uebung</ax25:type>
                        </ax25:previousLectures>
                        <ax25:previousLectures xsi:type="ax25:LectureTO">
                           <ax25:hyperlink xsi:nil="true"/>
                           <ax25:id>31640</ax25:id>
                           <ax25:infoURL><![CDATA[https://lsf.uni-konstanz.de/qisserver/rds?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&veranstaltung.veranstid=31640]]></ax25:infoURL>
                           <ax25:number>INF-10275-20121</ax25:number>
                           <ax25:title>Master-Projekt Verteilte Systeme</ax25:title>
                           <ax25:type>Projekt</ax25:type>
                        </ax25:previousLectures>
                        <ax25:projects xsi:nil="true"/>
                        <ax25:publicationGroups xsi:nil="true"/>
                        <ax25:researchIntentions xsi:type="ax25:ResearchIntentionRefTO">
                           <ax25:researchIntention xsi:type="ax25:ResearchIntentionTO">
                              <ax25:awards xsi:nil="true"/>
                              <ax25:description xsi:nil="true"/>
                              <ax25:doctoralDissertations xsi:nil="true"/>
                              <ax25:end xsi:nil="true"/>
                              <ax25:externalParticipants xsi:nil="true"/>
                              <ax25:id>2003</ax25:id>
                              <ax25:institutions xsi:nil="true"/>
                              <ax25:participants xsi:nil="true"/>
                              <ax25:publications xsi:nil="true"/>
                              <ax25:relatedProjects xsi:nil="true"/>
                              <ax25:researchIntentions xsi:nil="true"/>
                              <ax25:shortDescription xsi:nil="true"/>
                              <ax25:sponsorings xsi:nil="true"/>
                              <ax25:start xsi:nil="true"/>
                              <ax25:title>Secure Networking and Storage</ax25:title>
                              <ax25:titleEn xsi:nil="true"/>
                              <ax25:wobsiteURL xsi:nil="true"/>
                              <ax25:workshops xsi:nil="true"/>
                           </ax25:researchIntention>
                           <ax25:riRole>2</ax25:riRole>
                        </ax25:researchIntentions>
                        <ax25:roomId>971</ax25:roomId>
                        <ax25:roomNumber>V 521</ax25:roomNumber>
                        <ax25:secretary xsi:nil="true"/>
                        <ax25:sex>M</ax25:sex>
                        <ax25:street>230</ax25:street>
                        <ax25:supervisions xsi:nil="true"/>
                        <ax25:systemStatus>A</ax25:systemStatus>
                        <ax25:totalNumberOfPublications>15</ax25:totalNumberOfPublications>
                        <ax25:wobsiteURL>http://www.disy.uni-konstanz.de/en/members/sebastian-graf/</ax25:wobsiteURL>
                        <ax25:workshops xsi:nil="true"/>
                        <ax25:zip>78457</ax25:zip>
                     </ns:return>
                  </ns:getPersonProfileResponse>
               </soapenv:Body>
            </soapenv:Envelope>')
    end
    
    it 'gives back a fully migrated author object' do
      author_profile = @xml.xpath("//ns:return", 'ns' => "http://service.fpkn.unikn.de")
      
      a = migrate_person_profile author_profile
      
      (a.fn == 'Sebastian').should be_true
      (a.sn == 'Graf').should be_true
    end
  end
  
  describe "#author_link" do
    before do
      @author1 = Author.new :name => "sebastian.graf", :email => "sebastian.graf@uni-konstanz.de", :uid => "pop34027"
      @author2 = Author.new :name => "andreas.rain", :email => "andreas.rain@uni-konstanz.de", :uid => "pop321313"
      @author3 = Author.new :name => "susi.susi", :email => "susi.susi@uni-konstanz.de"
    end
    
    it 'it gives back an author link to a diaspora user' do
      link = author_link @author1
      (link == @author1.name).should be_false
    end
    
    it 'it gives back a link to an external scikon profile' do
      link = author_link @author2
      (link == @author2.name).should be_false
    end
    
    it 'it gives back the authors name' do
      link = author_link @author3
      (link == @author3.name).should be_true
    end
  end
  
end
