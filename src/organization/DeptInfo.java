package organization;

import java.util.Date;

public class DeptInfo {
		int deptid;
		String deptcode;
		String deptname;
		int depttype;
		String  parentid;
		String location;
		String postcode;
		String telephone;
		String fax;
		String mail;

		public int getDeptid() {
			return deptid;
		}
		public void setDeptid(int deptid) {
			this.deptid = deptid;
		}
		public String getDeptcode() {
			return deptcode;
		}
		public void setDeptcode(String deptcode) {
			this.deptcode = deptcode;
		}
		public String getDeptname() {
			return deptname;
		}
		public void setDeptname(String deptname) {
			this.deptname = deptname;
		}
		public int getDepttype() {
			return depttype;
		}
		public void setDepttype(int depttype) {
			this.depttype = depttype;
		}
		public String getParentid() {
			return parentid;
		}
		public void setParentid(String parentid) {
			this.parentid = parentid;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getPostcode() {
			return postcode;
		}
		public void setPostcode(String postcode) {
			this.postcode = postcode;
		}
		public String getTelephone() {
			return telephone;
		}
		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}
		public String getFax() {
			return fax;
		}
		public void setFax(String fax) {
			this.fax = fax;
		}
		public String getMail() {
			return mail;
		}
		public void setMail(String mail) {
			this.mail = mail;
		}
/*		public int getIsremoved() {
			return isremoved;
		}
		public void setIsremoved(int isremoved) {
			this.isremoved = isremoved;
		}
		public Date getRemoveddate() {
			return removeddate;
		}
		public Date setRemoveddate(Date removeddate) {
			return this.removeddate = removeddate;
		}*/
		
}
