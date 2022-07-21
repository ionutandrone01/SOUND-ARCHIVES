package pojo;



import java.util.HashSet;
import java.util.Set;

public class Albume  implements java.io.Serializable {


	private Long idalbum;
	private String nume;
	private String tip;
	
	private Set artisti = new HashSet(0);

	public Albume() {
	}

	public Albume(String nume, String tip, Set artisti) {
		this.nume = nume;
		this.tip = tip;
		this.artisti = artisti;
	}

	public Long getIdalbum() {
		return this.idalbum;
	}

	public void setIdalbum(Long idalbum) {
		this.idalbum = idalbum;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getTip() {
		return this.tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
	
	public Set getArtisti() {
		return this.artisti;
	}

	public void setArtisti(Set artisti) {
		this.artisti = artisti;
	}
}